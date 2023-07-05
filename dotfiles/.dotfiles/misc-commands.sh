# Git
,gb() {
    git checkout $(git branch --sort=-committerdate | fzf)
}

