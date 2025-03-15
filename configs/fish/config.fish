if status is-interactive
    # Commands to run in interactive sessions can go here
end
fastfetch
function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience
zoxide init fish | source
abbr --add foe "cd ~/github/TheInvisibleFoe/"
abbr --add v nvim
abbr --add zz zathura
abbr --add ls eza
abbr --add ll "eza -alh"
abbr --add cd z
abbr --add spt ~/.cargo/bin/spotify_player
# Conda startup script
source ~/miniconda3/etc/fish/conf.d/conda.fish

# Path to system Python3
set fish_user_paths $fish_user_paths /Library/Frameworks/Python.framework/Versions/3.6/bin/

# For Conda < 4.4.0 prepend Conda path to fish path (should be removable in Conda 4.4.0+)
set fish_user_paths $fish_user_paths ~/miniconda3/bin/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/sab/miniconda3/bin/conda
    eval /home/sab/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/sab/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/sab/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /home/sab/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<
