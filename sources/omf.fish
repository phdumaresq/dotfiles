# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

echo "Hi Philip!"

# alias ls="ls -l"
alias py="python3"
alias pip="pip3"
alias lr="tree --dirsfirst --sort='name'"

function acp
    set com $argv[1]
    set branch $argv[2]

    echo "Commit message: $com"
    echo "Branch name: $branch"

    if test -e ./package.json
        npm version patch --no-git-tag-version -f
    end

    git add .
    git commit -m "$com"
    git push origin $branch
end


function acpp
    set com $argv[1]
    set branch $argv[2]

    echo "Commit message: $com"
    echo "Branch name: $branch"

    if test -e ./package.json
        npm version patch --no-git-tag-version -f
    end

    git add .
    git commit -m "$com"
    git pull origin $branch
    git push origin $branch
end

function rs
    . ~/.config/fish/conf.d/omf.fish
end

# powerline-daemon -q
# set POWERLINE_BASH_CONTINUATION 1
# set POWERLINE_BASH_SELECT 1
# set fish_function_path $fish_function_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
# powerline-setup