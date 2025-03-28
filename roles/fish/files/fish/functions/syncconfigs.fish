function syncconfigs
	set -l target $argv[1]

	switch $target
		case "fish"
			rsync -av --delete --exclude='bitwarden.fish' ~/.config/fish/ ~/.dotconfigs/roles/fish/files/fish
	end

end

