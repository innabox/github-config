#!/bin/sh

sed '
/./,$!d
/^Error/ i\
\
> [!WARNING]\
>

s/^  /    /
s/^/> /
'
