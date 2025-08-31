git_clone_if_not_exists() {
  local repo_url="$1"
  local options="$2"
  local target_dir="$3"

  if [[ ! -d "$target_dir" ]]; then
    echo "📥 $repo_url clone..."
    git clone "$options" "$repo_url" "$target_dir"
  fi
}

maybe_eval() {
  local cmd="$1"
  shift
  if command -v "$cmd" >/dev/null 2>&1; then
    eval "$("$cmd" "$@")"
  fi
}

maybe_alias() {
  local cmd="$1"
  local alias_name="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    alias "$alias_name"="$cmd"
  fi
}
