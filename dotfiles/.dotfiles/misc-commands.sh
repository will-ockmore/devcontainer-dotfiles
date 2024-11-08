# Git
,gb() {
    git checkout $(git branch --sort=-committerdate | fzf)
}

,feat() {
    git checkout main && git pull && git checkout -b "wo/$1"
}
