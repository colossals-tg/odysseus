#!/bin/bash
set -e

export DATABASE_URL="${DATABASE_URL:-sqlite:///./data/app.db}"
export ODYSSEUS_ADMIN_PASSWORD="${ODYSSEUS_ADMIN_PASSWORD:-Odyssey@2025}"

echo ""
echo "============================================"
echo "   Odysseus - Self-hosted AI Workspace"
echo "============================================"
echo "  Username : admin"
echo "  Password : ${ODYSSEUS_ADMIN_PASSWORD}"
echo "  (Change after first login in Settings)"
echo "============================================"
echo ""

python setup.py

exec python -m uvicorn app:app \
    --host 0.0.0.0 \
    --port "${PORT:-7000}"
