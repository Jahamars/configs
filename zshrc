# Устанавливаем правильный путь к Oh My Zsh
export ZSH=$HOME/.oh-my-zsh

# Тема Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-$ZSH/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme

# Настройки терминала
export TERM="xterm-256color"

# Настройки темы Powerlevel10k
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{white}╭─%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}╰─   %f "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Элементы левой и правой части подсказки
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time)
POWERLEVEL9K_SHOW_CHANGESET=true

# Цветовые настройки
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='235'
POWERLEVEL9K_NVM_BACKGROUND="235"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="brightwhite"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="235"
POWERLEVEL9K_TIME_BACKGROUND='235'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='235'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_DIR_BACKGROUND='235'
POWERLEVEL9K_DIR_FOREGROUND='255'

# Отключение автоматических обновлений
export DISABLE_AUTO_UPDATE="true"

# Плагины Oh My Zsh (использование отложенной загрузки)
plugins=(
    archlinux
    web-search    
    gitfast
    zsh-syntax-highlighting
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# Подсветка синтаксиса
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES+=(
    [cursor]='bold'
    [alias]='fg=brightyellow,bold'
    [suffix-alias]='fg=brightyellow,bold'
    [builtin]='fg=brightyellow,bold'
    [function]='fg=brightyellow,bold'
    [command]='fg=brightyellow,bold'
    [precommand]='fg=brightyellow,bold'
    [hashed-command]='fg=brightyellow,bold'
)

# Функция для открытия zsh в текущем каталоге с последующим возвратом в последний каталог ranger
ranger-cd() {
    local tempfile=$(mktemp)
    ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
    [ -f "$tempfile" ] && cd -- "$(cat "$tempfile")" && rm -f "$tempfile"
    VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd

# Алиасы для часто используемых команд
alias py='python3'
alias cdcpp='cd ~/all/cpp'
alias cdpy='cd ~/all/py'
alias cdbash='cd ~/all/bash'

# Функция для компиляции и запуска C++ программ
compile_and_run_cpp() {
    local source_file="$1"
    local executable_file="${source_file%.cpp}"

    g++ -std=c++17 -o "$executable_file" "$source_file" && ./"$executable_file"
}
alias cpp='compile_and_run_cpp'

# Алиас для создания нового C++ файла из шаблона
mkcpp() {
    if [[ $1 == *.cpp ]]; then
        echo -e "#include <iostream>\nusing namespace std;\n\nint main() {\n    // Your code here\n    return 0;\n}" > "$1" && micro "$1"
    else
        echo "Error: The file must have a .cpp extension"
    fi
}
alias mkcpp='mkcpp'
alias sshr='sudo systemctl restart sshd'
alias sshs='sudo systemctl stop sshd'
alias sshh='sudo systemctl status sshd'


# отключаем звук 
export NO_BELL=true
setopt NO_BEEP
