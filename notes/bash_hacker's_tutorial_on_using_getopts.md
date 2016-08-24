# Bash Hacker's tutorial on using getopts

Tags: bash getopts tutorial

Created: 2016-08-24 10:48:33

[Small getopts tutorial [Bash Hackers Wiki]](http://wiki.bash-hackers.org/howto/getopts_tutorial)

The gist is that, by using a command like `getopts fAx VARNAME`, it will act
like a program that can accept `-f`, `-A`, `-x` flags. If you want it to accept
an argument, you instead use `getopts fA:x VARNAME` which means that `-A` will
accept an argument.
