export EDITOR=nvim
export KUBECONFIG=~/.kube/k3s.yaml
ZSH_THEME="miloshadzic"

git_clone_if_not_exists "https://github.com/nvm-sh/nvm.git" "--depth=1" "$HOME/.nvm"