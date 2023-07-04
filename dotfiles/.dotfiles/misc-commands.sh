# Git
,gb() {
    git checkout $(git branch --sort=-committerdate | rg '\bwo/' | fzf)
}

