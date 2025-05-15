#!/bin/sh
echo -e "\e[32m--[*]-[ git log ]-----\e[0m"
git -P log --graph --oneline | head -n 10
echo -e "\e[32m--[*]-[ git remote ]--\e[0m"
git remote -v
echo -e "\e[32m--[*]-[ git status ]--\e[0m"
git status
echo -e "\e[32m--[*]-[ done ]--------\e[0m"
