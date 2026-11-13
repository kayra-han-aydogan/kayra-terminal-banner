# Kayra Terminal Banner

A small Bash startup banner that displays a purple, patterned **KAYRA** title whenever an interactive terminal starts.

## Preview

```text
       ✦･ﾟ: *✧･ﾟ:*  K A Y R A  *:･ﾟ✧*:･ﾟ✦
       ░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░
              KAYRA in large FIGlet text
       ✦ ░▒▓█▓▒░ ✦ ░▒▓█▓▒░ ✦ ░▒▓█▓▒░ ✦
```

The large title uses the `slant` FIGlet font when `figlet` is installed. A built-in text fallback is used when it is not installed. No package installation or `sudo` access is required.

## Requirements

- Bash
- Fedora KDE or another Linux distribution using Bash

## Install

Download or clone this repository, open a terminal in the project directory, and run:

```bash
chmod +x install.sh
./install.sh
```

The installer copies the banner to `~/.local/share/kayra-terminal-banner/` and adds one managed startup block to `~/.bashrc`. It is safe to run more than once.

To show the banner immediately without opening a new terminal:

```bash
source ~/.bashrc
```

## Uninstall

From the project directory, run:

```bash
chmod +x uninstall.sh
./uninstall.sh
```

The uninstaller removes only the managed block from `~/.bashrc` and the installed banner directory. Other Bash configuration is left untouched.

## Disable colors

Set `NO_COLOR` before opening Bash to disable ANSI colors:

```bash
NO_COLOR=1 bash
```

## GitHub upload

Create a new empty repository on GitHub named `kayra-terminal-banner`. Then run these commands from this project directory, replacing `YOUR_USERNAME` with your GitHub username:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/kayra-terminal-banner.git
git push -u origin main
```

## License

MIT. See [LICENSE](LICENSE).
