# ~/.gdbinit — read by gdb every time it starts.

# Remember commands between gdb sessions (use the up arrow, like in bash).
set history save on
set history size 10000
set history filename ~/.gdb_history

# Print structs one field per line instead of one long line.
set print pretty on

# Don't ask "are you sure?" when you quit or restart a running program.
set confirm off

# Don't stop long output with "--Type <RET> for more--".
set pagination off

# Show 20 lines of source around the current line with `list`.
set listsize 20
