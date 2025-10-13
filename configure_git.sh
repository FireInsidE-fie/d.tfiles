#/bin/bash

git config --global --unset user.name
git config --global --unset user.email
git config --global --unset --global init.defaultbranch

git config --global user.name "Aisling Fontaine"
git config --global user.email "aisling.fontaine@protonmail.com"
git config --global pull.rebase true
git config --global init.defaultbranch "main"

echo "[!] - Configuring done! Don't forget to setup your ssh key(s) <3"
