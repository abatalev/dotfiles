#!/bin/sh
tagless=$(~/.local/bin/zk list -P -q --format=oneline --tagless | wc -l)
orphan=$(~/.local/bin/zk list -P -q --format=oneline --orphan | wc -l)
if [ "x${tagless}" != "x0" ]; then
    ~/.local/bin/zk edit --interactive --tagless --sort=modified-
elif [ "x${tagless}" != "x0" ]; then
    ~/.local/bin/zk edit --interactive --orphan --sort=modified-
else
    ~/.local/bin/zk edit --interactive --sort=modified-
fi   