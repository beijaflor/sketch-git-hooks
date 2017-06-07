#!/bin/sh
if [ -d '.git' ]; then
  if [ -f '.git/hooks/post-checkout' ]; then
    mv .git/hooks/post-checkout script/post-checkout.old
  fi

  if [ -L '.git/hooks/post-checkout' ]; then
    rm .git/hooks/post-checkout
  fi

  ls -s ../../post-checkout .git/hooks/post-checkout
  chmod -x script/post-checkout
fi
