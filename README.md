# dotfiles

## Usage
```
$ ./setup.sh
```

## Customize
```
[ Enable git diff on VIM ]
$ git config --global diff.tool vimdiff
$ git config --global difftool.prompt false

[ Disable git diff on VIM ]
$ vi ~/.gitconfig

	# Remove the below lines
	[diff]
		tool = vimdiff
	[difftool]
		prompt = false
```
