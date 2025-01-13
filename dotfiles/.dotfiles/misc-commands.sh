# Git
,gb() {
    local branch=$(git branch --format='%(refname:short)' --sort=-committerdate | fzf)
    if [[ -n "$branch" ]]; then
        git checkout "$branch"
    else
        echo "No branch selected"
    fi
}

,feat() {
    if [[ -z "$1" ]]; then
        echo "Please provide a feature name"
        return 1
    fi
    git checkout main && \
    git pull && \
    git checkout -b "wo/$1"
}
