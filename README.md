# Install

## Install nix, if you don't already have it

### Determinite nix
```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Set appropriate home-manager channel
```
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
nix-channel --update
```

## Install home-manager
```
nix-shell '<home-manager>' -A install
```

## Clone this repo into your config
```
mv ~/.config/home-manager ~/.config/home-manager.bak
git clone git@github.com:ZacheryFaria/home-manager.git ~/.config/home-manager
```

## Switch to the config and switch
```
cd ~/.config/home-manager
home-manager switch
```
