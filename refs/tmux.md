# Tmux cheat sheet

## Sessions

### New Sessions

tmux
tmux new
tmux new-session
tmux new -s sessionname

### Attach Sessions

tmux a
tmux att
tmux attach
tmux attach-session
tmux a -t sessionname

### Remove Sessions

tmux kill-ses
tmux kill-session -t sessionname

### Sessions Key Bindings

|            |                  |
| ---------- | ---------------- |
| CTRL + B $ | rename session   |
| CTRL + B D | detach session   |
| CTRL + B ) | next session     |
| CTRL + B ( | previous session |

## Windows

Windows are like tabs in a browser. Windows exist in Sessions and occupy the space of a session screen.

### Windows Key Bindings

|                |                          |
| -------------- | ------------------------ |
| CTRL + B C     | create window            |
| CTRL + B N     | move to next window      |
| CTRL + B P     | move to previous window  |
| CTRL + B L     | move to window last used |
| CTRL + B 0 … 9 | select window by number  |
| CTRL + B ‘     | select window by name    |
| CTRL + B .     | change window number     |
| CTRL + B ,     | rename window            |
| CTRL + B F     | search windows           |
| CTRL + B &     | kill window              |
| CTRL + B W     | list windows             |

## Panes

Panes are sections of windows that have been split into different screens — just like the panes of a real window!

### Panes Key Bindings

|            |                           |
| ---------- | ------------------------- |
| CTRL + B % | vertical split            |
| CTRL + B “ | horizontal split          |
| CTRL + B → | move to pane to the right |
| CTRL + B ← | move to pane to the left  |
| CTRL + B ↑ | move up to pane           |
| CTRL + B ↓ | move down to pane         |
| CTRL + B O | go to next pane           |
| CTRL + B ; | go to last active pane    |
| CTRL + B } | move pane right           |
| CTRL + B { | move pane left            |
| CTRL + B ! | convent pane to window    |
| CTRL + B X | kill pane                 |

## Copy Mode

### Copy Mode Key Bindings

|            |                   |
| ---------- | ----------------- |
| CTRL + B [ | enter copy mode   |
| CTRL + B ] | paste from buffer |

### Copy Mode Commands

|       |                    |
| ----- | ------------------ |
| space | start selection    |
| enter | copy selection     |
| esc   | clear selection    |
| g     | go to top          |
| G     | go to bottom       |
| h     | move cursor left   |
| j     | move cursor down   |
| k     | move cursor up     |
| l     | move cursor right  |
| /     | search             |
| #     | list paste buffers |
| q     | quit               |