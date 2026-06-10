# Minecraft Bedrock Dedicated Server - Railway deployment
# Based on the well-maintained itzg/minecraft-bedrock-server image,
# which downloads the official server from minecraft.net automatically.
FROM itzg/minecraft-bedrock-server:latest

# Default settings (can be overridden as environment variables in Railway)
ENV EULA=TRUE \
    VERSION=LATEST \
    SERVER_NAME="X APP Bedrock Server" \
    GAMEMODE=survival \
    DIFFICULTY=normal \
    MAX_PLAYERS=10 \
    ONLINE_MODE=true \
    ALLOW_CHEATS=false \
    LEVEL_NAME="Bedrock level" \
    SERVER_PORT=19132 \
    SERVER_PORT_V6=19133

# Bedrock uses UDP
EXPOSE 19132/udp 19133/udp
