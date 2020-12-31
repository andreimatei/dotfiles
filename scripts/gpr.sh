#!/usr/bin/env sh

set -eu

error_message() {
  ret=$?
  if [ $ret -ne 0 ]; then
    echo "Something went wrong. Did you push your branch? Did you set a remote tracking branch?"
  fi
  exit $ret
}

trap error_message EXIT

if [ $# == 0 ]; then
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  remote_name=$(git config branch."$branch_name".remote)

  github_forked_org_name=$(git config remote."$remote_name".url | sed -E -e 's,^(https://|git@)github.com[:/]([^\./]+)/[^\./]+(\.git)?,\2,')
  github_origin_proj_url=$(git config remote.origin.url         | sed -E -e 's,^(https://|git@)github.com[:/]([^\./]+/[^\./]+)(\.git)?,\2,')

  url="https://github.com/$github_origin_proj_url/compare/master...$github_forked_org_name:$branch_name?expand="

  open "$url"
else
  hub fetch origin refs/pull/"$1"/head:pr/"$1" && hub checkout pr/"$1"
fi

