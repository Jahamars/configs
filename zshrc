
##my
# Устанавливаем правильный путь к Oh My Zsh
ZSH=$HOME/.oh-my-zsh

# Устанавливаем пользователя по умолчанию и тип терминала
export DEFAULT_USER="=^..^="
export TERM="xterm-256color"

# Устанавливаем тему Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme

# ASCII Art Banner
function hacker_banner() {
    cat <<'EOF'

              WHERE ARE YOU GOING 
 
EOF
}
hacker_banner


POWERLEVEL9K_CONTEXT_TEMPLATE='=^..^='

PROMPT=' '

# Настройки темы Powerlevel10k
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='235'
POWERLEVEL9K_NVM_BACKGROUND="235"
POWERLEVEL9K_NVM_FOREGROUND="green"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="brightwhite"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="235"
POWERLEVEL9K_TIME_BACKGROUND='235'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='235'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time time)
POWERLEVEL9K_SHOW_CHANGESET=true


# Настройка цветов фона и текста для каждого сегмента
POWERLEVEL9K_DIR_BACKGROUND='235'  # Цвет фона для пути каталога (~)
POWERLEVEL9K_DIR_FOREGROUND='255'  # Цвет текста для пути каталога (~)
# Прочие настройки Zsh
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Плагины Oh My Zsh
plugins=(archlinux
    asdf
    bundler
    docker
    jsontools
    vscode
    web-search
    tig
    gitfast
    colored-man-pages
    colorize
    command-not-found
    cp
    dirhistory
    sudo
    zsh-syntax-highlighting)


# Источник Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Настройки подсветки синтаксиса
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[cursor]='bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=brightyellow,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=brightyellow,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=brightyellow,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=brightyellow,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=brightyellow,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=brightyellow,bold'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=brightyellow,bold'

# Пользовательские функции и привязки клавиш
rule () {
 print -Pn '%F{blue}'
 local columns=$(tput cols)
 for ((i=1; i<=columns; i++)); do
    printf "\u2588"
 done
 print -P '%f'
}

function _my_clear() {
 echo
 rule
 zle clear-screen
}
zle -N _my_clear
bindkey '^l' _my_clear

# Ctrl-O открывает zsh в текущем каталоге и при выходе переходит в последний каталог ranger
ranger-cd() {
 tempfile=$(mktemp)
 ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
 test -f "$tempfile" &&
 if [ "$(cat -- "$tempfile")" != "$(echo -n pwd)" ]; then
 cd -- "$(cat "$tempfile")"
 fi
 rm -f -- "$tempfile"
 # хитрый способ переноса предыдущей команды и обновления экрана
 VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd

# Отключение автоматических обновлений
DISABLE_AUTO_UPDATE="true"

# Кеширование Oh My Zsh
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi