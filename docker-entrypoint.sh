#!/bin/bash
set -e

# Link any binaries installed by brew (runtime installs) to /usr/local/bin
# so the app can find them easily if PATH expansion is tricky
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]; then
    ln -s /home/linuxbrew/.linuxbrew/bin/* /usr/local/bin/ 2>/dev/null || true
fi

# Limpeza proativa de travas do Chrome para evitar erro "Profile in use"
echo "Limpando travas de perfil do Chrome..."
find /root/.openclaw -name "Singleton*" -delete 2>/dev/null || true
find /data -name "Singleton*" -delete 2>/dev/null || true

# Execute the original command
exec tini -- "$@"
