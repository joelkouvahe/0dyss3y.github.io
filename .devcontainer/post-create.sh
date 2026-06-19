#!/usr/bin/env bash

# Arrête le script en cas d'erreur
set -e

echo "🔧 Exécution du script post-create..."

# 1. Installation Node.js si package.json existe
if [ -f "package.json" ]; then
  echo "📦 package.json trouvé → installation de Node.js LTS..."
  # On enlève l'option -i (interactive) pour éviter les problèmes
  bash -c "nvm install --lts && nvm install-latest-npm"
  echo "📦 Installation des dépendances npm..."
  npm install
  echo "🏗️  Build du projet..."
  npm run build
else
  echo "ℹ️  Aucun package.json trouvé, étape Node.js sautée."
fi

# 2. Installation de shfmt (formateur shell)
echo "🔧 Installation de shfmt..."
curl -sS https://webi.sh/shfmt | sh

# 3. Ajout des plugins Zsh (si Oh My Zsh est présent)
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "🛠️  Ajout des plugins Zsh..."
  # Clone les plugins s'ils ne sont pas déjà présents
  [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ] && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git \
      "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

  # Ajout des plugins dans .zshrc (si pas déjà présents)
  if ! grep -q "zsh-syntax-highlighting" "$HOME/.zshrc"; then
    sed -i -E "s/^(plugins=\()([^)]*)(\))/\1\2 zsh-syntax-highlighting zsh-autosuggestions\3/" "$HOME/.zshrc"
  fi
else
  echo "⚠️  Oh My Zsh n'est pas installé, les plugins ne sont pas ajoutés."
fi

# 4. Éviter l'usage de 'less' pour git log
if ! grep -q "unset LESS" "$HOME/.zshrc"; then
  echo -e "\n# Désactiver less pour git log\nunset LESS" >> "$HOME/.zshrc"
fi

echo "✅ Script post-create terminé avec succès."
