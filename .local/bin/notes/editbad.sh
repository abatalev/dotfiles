#!/bin/sh
tagless=$(zk list -P -q --format=oneline --tagless | wc -l)
orphan=$(zk list -P -q --format=oneline --orphan | wc -l)
if [ "x${tagless}" != "x0" ]; then
    zk edit --interactive --tagless --sort=modified-
elif [ "x${orphan}" != "x0" ]; then
    zk edit --interactive --orphan --sort=modified-
else
    zk edit --interactive --sort=modified-
fi   