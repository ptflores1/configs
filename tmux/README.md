# tmux

Includes the active tmux config and sessionizer search-path settings. Install tmux and `tmux-sessionizer` first, then run:

```sh
./tmux/install.sh
```

Start tmux and press `prefix` then `I` to install plugins through TPM. The config binds `C-f` to `tmux-sessionizer`; that command must be on `PATH`. `tmux-sessionizer.conf` includes a local repository search path that you can adjust per machine.
