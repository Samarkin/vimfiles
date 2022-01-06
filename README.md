# VIM configuration

## Usage

### Unix

1. Make sure `~/.vimrc` and `~/.vim` do not exist.
2. Execute the following command:
```
git clone --recurse-submodules https://github.com/Samarkin/vimfiles ~/.vim
```
Some distributions of git don't support HTTPS. If that's your case, use the following command instead:
```
git clone --recurse-submodules git://github.com/Samarkin/vimfiles ~/.vim
```
3. To update:
```
cd ~/.vim
git pull
```

### Windows

1. Make sure `%USERPROFILE%\_vimrc` and `%USERPROFILE%\vimfiles` do not exist.
2. Execute the following command:
```
git clone https://github.com/Samarkin/vimfiles %USERPROFILE%\vimfiles
```
3. To update:
```
cd %USERPROFILE%\vimfiles
git pull
```

## User-specific settings

To provide user-specific settings, create a file named `private.vimrc` in your user's home folder.
