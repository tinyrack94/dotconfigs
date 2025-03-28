function syncconfigs
	rsync -av --delete --exclude='bitwarden.fish' ~/.config/fish/ ~/.dotconfigs/roles/fish/files/fish
end
