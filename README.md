# dotfiles

Personal dotfiles. 

## Usage

1. Install chezmoi
```bash
curl -sfL https://git.io/chezmoi | sh -s -- -b ./.bin
```

2. Install dotfile with chezmoi 
```bash
~/.bin/chezmoi -S ~/.chezmoi init https://github.com/firstmover/dotfiles.git
```

3. Apply dotfile to local machine 
```bash
~/.bin/chezmoi -S ~/.chezmoi apply
```

## Acknowledgement

[thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)

[wfxr/dotfiles](https://github.com/wfxr/dotfiles)

[vacancy/dotfiles](https://github.com/vacancy/dotfiles)
