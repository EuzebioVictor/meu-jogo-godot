#!/usr/bin/env bash
# Verificação completa: importação, lint e testes. Uso: ./tools/check.sh
set -euo pipefail
cd "$(dirname "$0")/.."
GODOT="${GODOT:-godot}"
LOG="$(mktemp)"

echo "==> Importando projeto"
"$GODOT" --headless --import >/dev/null 2>&1 || true
"$GODOT" --headless --quit 2>&1 | tee "$LOG"
if grep -qE "SCRIPT ERROR|Parse Error|ERROR:" "$LOG"; then
	echo "Erros ao carregar o projeto." >&2
	exit 1
fi

if command -v gdlint >/dev/null; then
	echo "==> Lint"
	gdlint scripts scenes tests
	gdformat --check scripts scenes tests
fi

echo "==> Testes"
"$GODOT" --headless -s addons/gut/gut_cmdln.gd -gconfig=.gutconfig.json
