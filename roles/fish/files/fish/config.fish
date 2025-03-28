set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# apply user bin
set -x PATH ~/.local/bin $PATH

# kubernetes configs
set -x KUBECONFIG ~/.kube/k3s.yaml

kubectl completion fish | source

