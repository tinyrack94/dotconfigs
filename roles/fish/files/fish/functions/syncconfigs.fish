function syncconfigs
    set -l target $argv[1]

    switch $target
        case fish
            rsync -vrl --delete --exclude='bitwarden.fish' ~/.config/fish/ ~/.dotconfigs/roles/fish/files/fish
        case nvim
            rsync -vrl --delete ~/.config/nvim/ ~/.dotconfigs/roles/nvim/files/nvim
    end

end
