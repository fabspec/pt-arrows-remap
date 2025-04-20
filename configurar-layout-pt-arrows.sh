#!/bin/bash

echo "🧱 A criar layout personalizado para teclado PT com setas + Shift..."

# Criar ficheiro de layout personalizado
sudo tee /usr/share/X11/xkb/symbols/custom_pt_arrows > /dev/null <<'EOF'
default partial alphanumeric_keys
xkb_symbols "arrows_with_shift" {

    include "pt(basic)"

    key <LEFT> {
        type = "TWO_LEVEL",
        symbols[Group1] = [ Left, less ]
    };

    key <RGHT> {
        type = "TWO_LEVEL",
        symbols[Group1] = [ Right, greater ]
    };
};
EOF

echo "✅ Layout custom_pt_arrows criado com sucesso."

# Aplicar layout temporariamente
echo "🧪 A aplicar layout para esta sessão..."
setxkbmap -layout custom_pt_arrows -variant arrows_with_shift

# Tornar permanente no KDE
echo "💾 A configurar layout permanente no KDE..."

# Assegurar que a secção [Layout] existe
if ! grep -q "^\[Layout\]" ~/.config/kxkbrc 2>/dev/null; then
    echo "[Layout]" >> ~/.config/kxkbrc
fi

# Remover LayoutList antigo, se existir, e definir o novo
sed -i '/^LayoutList=/d' ~/.config/kxkbrc
echo "LayoutList=custom_pt_arrows(arrows_with_shift)" >> ~/.config/kxkbrc

echo "✅ Layout configurado com sucesso!"
echo "🔁 Faz logout/login ou corre: systemctl --user restart plasma-plasmashell"
