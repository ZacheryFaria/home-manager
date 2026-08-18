# Install

## Install nix, if you don't already have it

### Install nix
```bash
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

## Set appropriate home-manager channel
```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
nix-channel --update
```

## Install home-manager
```bash
nix-shell '<home-manager>' -A install
```

## Clone this repo into your config
```bash
mv ~/.config/home-manager ~/.config/home-manager.bak
git clone git@github.com:ZacheryFaria/home-manager.git ~/.config/home-manager
```

## Switch to the config and switch
```bash
cd ~/.config/home-manager
home-manager switch
```
