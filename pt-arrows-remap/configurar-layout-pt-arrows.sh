#!/bin/bash

echo "🧱 A criar layout personalizado para teclado PT com setas + Shift..."
sudo cp custom_pt_arrows /usr/share/X11/xkb/symbols/custom_pt_arrows

echo "🧪 A aplicar layout para esta sessão..."
setxkbmap -layout custom_pt_arrows -variant arrows_with_shift

echo "💾 A configurar layout permanente no KDE..."
if ! grep -q "^\[Layout\]" ~/.config/kxkbrc 2>/dev/null; then
    echo "[Layout]" >> ~/.config/kxkbrc
fi

sed -i '/^LayoutList=/d' ~/.config/kxkbrc
echo "LayoutList=custom_pt_arrows(arrows_with_shift)" >> ~/.config/kxkbrc

echo "✅ Pronto! Reinicia a sessão para aplicar."
