# WaitForIt
Delays launch of programs in Windows.  Intended for use in the Startup folder, but could be useful elsewhere.

## Theory of Operation

When run without any options or arguments, the program exits silently.

When run without options but with arguments, the argument list is treated as a list of files.
The program will create a shortcut for each file in the user's Startup folder.

When run with both options and arguments, the program checks for the specified conditions, possibly witing for them to change state.
The argument list is treated as a program to launch and its arguments.

## TODO List

When run without any options or arguments, open a dialog to set defaults.

When creating shortcuts, if a specfied program is itself a shortcut, edit it in-place.

