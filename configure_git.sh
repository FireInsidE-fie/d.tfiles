#/bin/bash

git config --unset user.name
git config --unset user.email
git config --unset --global init.defaultbranch

git config user.name "Aisling Fontaine"
git config user.email "aisling.fontaine@protonmail.com"
git config --global pull.rebase true
git config --global init.defaultbranch "main"

echo "[!] - Configuring done! Don't forget to setup your ssh key(s) <3"
