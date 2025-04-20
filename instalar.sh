#!/bin/bash

echo "📦 A instalar remapeamento de setas com Shift para < e >..."
bash configurar-layout-pt-arrows.sh

if ! command -v kate &>/dev/null; then
    echo "💡 Podes instalar o editor gráfico Kate com: sudo dnf install kate"
fi
