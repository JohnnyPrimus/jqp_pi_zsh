#/bin/sh
INSTPATH="$HOME/.oh-my-zsh/plugins"

# Preferred editor for local and remote sessions
#if [ -n "${ZSH_CUSTOM}" ]; then
#  INSTPATH="${ZSH_CUSTOM}/plugins"
#  echo "Using ZSH custom install directory $INSTPATH"
#fi

if [ -d "${INSTPATH}/zsh-syntax-highlighting" ]; then
  echo "zsh-syntax-highlighting already installed"
else
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $INSTPATH/zsh-syntax-highlighting
fi

if [ -d "${INSTPATH}/zsh-history-substring-search" ]; then
  echo "zsh-history-substring-search already installed"
else
  git clone https://github.com/zsh-users/zsh-history-substring-search $INSTPATH/zsh-history-substring-search
fi

if [ -d "${INSTPATH}/zsh-autosuggestions" ]; then
  echo "zsh-autosuggestions already installed"
else
  git clone https://github.com/zsh-users/zsh-autosuggestions $INSTPATH/zsh-autosuggestions
fi

if [ -d "${INSTPATH}/fzf-zsh-plugin" ]; then
  echo "fzf-zsh-plugin already installed"
else
  git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git $INSTPATH/fzf-zsh-plugin
fi

if [ -d "$HOME/.autoenv" ]; then
  echo "autoenv already installed"
else
  git clone https://github.com/hyperupcall/autoenv $HOME/.autoenv
fi
