#!/usr/bin/env bash

# Check whether or not the
if [[ -z $(git status -s) ]]; then
    DIRTY=""
else
    DIRTY="\color{red} \textbf{(*)}"
fi

git --no-pager log -1 --date=short --decorate=short \
    --pretty=format:"\newcommand{\githash}{%h}

" HEAD

git --no-pager log -1 --date=short --decorate=short \
    --pretty=format:"\newcommand{\gitinfo}{%
  \textbf{Rev.}
  {%h}
  {$DIRTY}
  {\ [$(git rev-parse --abbrev-ref HEAD)]}%
}
" HEAD
