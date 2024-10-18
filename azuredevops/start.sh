#!/bin/bash
set -e

# Função para exibir logs com timestamp
log() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') [INFO] $1"
}

# Remove quebras de linha e espaços das variáveis de ambiente
AZP_URL=${AZP_URL%$'\n'}
AZP_TOKEN=${AZP_TOKEN%$'\n'}
AZP_POOL=${AZP_POOL%$'\n'}

# Verifica se as variáveis obrigatórias estão configuradas
if [ -z "$AZP_URL" ]; then
  echo "error: AZP_URL não definido"
  exit 1
fi

if [ -z "$AZP_TOKEN" ]; then
  echo "error: AZP_TOKEN não definido"
  exit 1
fi

# Configuração do diretório e permissões
AZP_TOKEN_FILE="/azp/.token"
log "Verificando permissões para /azp..."
mkdir -p /azp && chmod -R 777 /azp  # Garante que o diretório tenha permissão de escrita
echo -n "$AZP_TOKEN" > "$AZP_TOKEN_FILE"
unset AZP_TOKEN

# Cria o diretório de trabalho, se necessário
if [ -n "$AZP_WORK" ]; then
  mkdir -p "$AZP_WORK"
fi

# Função de limpeza ao encerrar o container
cleanup() {
  trap "" EXIT INT TERM
  if [ -e ./config.sh ]; then
    log "Removendo a configuração do agente..."
    while true; do
      ./config.sh remove --unattended --auth "PAT" --token "$(cat "$AZP_TOKEN_FILE")" && break
      log "Nova tentativa em 30 segundos..."
      sleep 30
    done
  fi
}

# Configura traps para capturar sinais e executar a função de limpeza
trap "cleanup; exit 0" EXIT
trap "cleanup; exit 130" INT
trap "cleanup; exit 143" TERM

# Baixa e extrai o agente Azure Pipelines
log "Baixando o agente do Azure Pipelines..."
AZP_AGENT_PACKAGES=$(curl -LsS \
  -u user:"$(cat "$AZP_TOKEN_FILE")" \
  -H "Accept:application/json" \
  "$AZP_URL/_apis/distributedtask/packages/agent?platform=$TARGETARCH&top=1")

AZP_AGENT_PACKAGE_LATEST_URL=$(echo "$AZP_AGENT_PACKAGES" | jq -r ".value[0].downloadUrl")

if [ -z "$AZP_AGENT_PACKAGE_LATEST_URL" ] || [ "$AZP_AGENT_PACKAGE_LATEST_URL" == "null" ]; then
  echo "error: Não foi possível encontrar o agente correspondente"
  exit 1
fi

log "Extraindo o agente..."
curl -LsS "$AZP_AGENT_PACKAGE_LATEST_URL" | tar -xz

source ./env.sh

# Configura o agente
log "Configurando o agente do Azure Pipelines..."
./config.sh --unattended \
  --agent "${AZP_AGENT_NAME:-$(hostname)}" \
  --url "$AZP_URL" \
  --auth "PAT" \
  --token "$(cat "$AZP_TOKEN_FILE")" \
  --pool "$AZP_POOL" \
  --work "${AZP_WORK:-_work}" \
  --replace \
  --acceptTeeEula

chmod +x ./run.sh

# Inicia o Docker daemon como usuário `agent`
log "Iniciando o Docker daemon..."
dockerd &  # Inicia o Docker daemon em segundo plano
sleep 10  # Aguarda alguns segundos para garantir que o Docker subiu

# Verifica se o Docker está funcionando
if ! docker ps > /dev/null 2>&1; then
  echo "error: Falha ao conectar ao Docker daemon"
  exit 1
fi

log "Docker iniciado com sucesso!"

# Inicia o agente Azure Pipelines
log "Iniciando o agente do Azure Pipelines..."
exec ./run.sh "$@"
