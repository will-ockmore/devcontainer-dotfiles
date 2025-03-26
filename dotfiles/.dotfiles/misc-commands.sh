# Git
,gb() {
    local branch=$(git branch --format='%(refname:short)' --sort=-committerdate | fzf | tr -d '[:space:]')
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

,gw() {
    if [[ "$(git branch --show-current)" == "main" ]]; then
        echo "ERROR: Cannot create WIP commit on main branch"
        return 1
    fi

    if ! git diff --quiet || ! git diff --cached --quiet; then
        git add -A
        git commit -m "wip"
    else
        echo "No changes to commit"
        return 1
    fi
}
