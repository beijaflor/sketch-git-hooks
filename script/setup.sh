#!/bin/sh -eu
registerHook () {
  if [ -d '.git' ]; then
    if [ -f ".git/hooks/$1" ]; then
      mv ".git/hooks/$1" "script/$1.old"
    fi

    if [ -L ".git/hooks/$1" ]; then
      rm ".git/hooks/$1"
    fi

    ln -s "../../script/$1" ".git/hooks/$1"
    chmod +x "script/$1"
  fi
}

hooks="post-checkout pre-commit"

for hook in $hooks; do
  registerHook $hook
done
