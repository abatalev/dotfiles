#!/bin/sh
tagless=$(~/.local/bin/zk list -P -q --format=oneline --tagless | wc -l)
orphan=$(~/.local/bin/zk list -P -q --format=oneline --orphan | wc -l)
all=$(~/.local/bin/zk list -P -q --format=oneline | wc -l)
echo -e "${tagless}|${orphan}|${all}"

out="\uf249"
if [ "x$tagless" != "x0" ]; then
    out=$(echo "$out%{F#AA0000}${tagless}%{F-}")
else
    out=$(echo "$out%{F#AAAAAA}${tagless}%{F-}")   
fi
if [ "x$orphan" != "x0" ]; then
    out=$(echo "${out}|%{F#AA0000}${orphan}%{F-}")
else
    out=$(echo "${out}|%{F#AAAAAA}${orphan}%{F-}")   
fi
out=$(echo "$out|${all}")
echo -e "${out}"