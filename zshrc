## my configuration

# Set the correct path to Oh My Zsh
ZSH=$HOME/.oh-my-zsh

# Set the default user and terminal type
export TERM="xterm-256color"

# Set the Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme

# ASCII Art Banner
function hacker_banner() {
    cat <<'EOF'
                                                        ┏┓┓ ┏┓┏┓                  
                                                        ┣┫┃•┏┛┣┓                  
                                    ┏┓       ┓          ┗┛┻•┗━┗┛           •    ┏┓
                                    ┗┓┏┓  ┓┏┏┣┓┏┓┏┓┏┓  ┏┓┏┓┏┓  ┓┏┏┓┓┏  ┏┓┏┓┓┏┓┏┓┏┛
                                    ┗┛┗┛  ┗┻┛┛┗┗ ┛ ┗   ┗┻┛ ┗   ┗┫┗┛┗┻  ┗┫┗┛┗┛┗┗┫• 
                                                                ┛       ┛      ┛  

     
EOF
}
hacker_banner


# Set the prompt to be empty initially
PROMPT=' '

# Powerlevel10k theme settings
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
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

# Define left and right prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time )

# Set colors for directory segment
POWERLEVEL9K_DIR_BACKGROUND='235'
POWERLEVEL9K_DIR_FOREGROUND='255'

# Set other zsh settings
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Oh My Zsh plugins
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

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Syntax highlighting settings
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

# Custom functions and key bindings
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

# Disable automatic updates
DISABLE_AUTO_UPDATE="true"

# Aliases
alias py='python3'
alias cdcpp='cd all/cpp'
alias cdpy='cd all/python'

# Function to compile and run C++ programs
compile_and_run_cpp() {
    if [ -z "$1" ]; then
        echo "Usage: compile_and_run_cpp <source_file.cpp>"
        return 1
    fi
    
    local source_file="$1"
    local executable_file="${source_file%.cpp}"

    # Compilation
    g++ -std=c++17 -o "$executable_file" "$source_file"
    if [ $? -ne 0 ]; then
        echo "Compilation failed"
        return 1
    fi

    # Execution
    ./"$executable_file"
}

# Alias to use the function conveniently
alias cpp='compile_and_run_cpp'

# Alias to create a new C++ file from a template
alias mkcpp='function _mkcpp(){ if [[ $1 == *.cpp ]]; then echo "#include <iostream>\nusing namespace std;\n\nint main() {\n    // Your code here\n    return 0;\n}" > "$1" && micro "$1"; else echo "Error: The file must have a .cpp extension"; fi; }; _mkcpp'

# Powerlevel10k prompt configuration for two-line prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}╭─%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}╰─ =^..^= >%f "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
