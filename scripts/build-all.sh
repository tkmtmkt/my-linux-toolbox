#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
BASE_DIR=$(cd $SCRIPT_DIR/..;pwd)
LOG_DIR=$BASE_DIR/log

[[ ! -d "$LOG_DIR" ]] && mkdir $LOG_DIR

while read PKG
do
  [[ $(echo $PKG | grep -e "^#") ]] && continue
  [[ -z $PKG ]] && continue
  echo -e "\n### build-$PKG"
  time $SCRIPT_DIR/build-$PKG.sh > $LOG_DIR/result-$PKG-$(date +%Y%m%d%H%M).log 2>&1
  RESULT=$?
  if [[ $RESULT -eq 0 ]]; then
    echo "Success"
  else
    echo "Failure($RESULT)"
    exit $RESULT
  fi
done <<'EOS'
### base
pkgconfig
perl
m4
autoconf
automake

### library
zlib
bzip
xz
ncurses
gettext
readline
expat

### util
openssl
curl
tar
p7zip
highway
global
sqlite3
nkf
jq
multitail

### gcc
#gmp
#mpfr
#mpc
#gcc

### language
python
ruby

### vim
vim

### git
git
tig

### tmux
libevent
tmux

### GnuPG
libgpg-error
npth
libgcrypt
libksba
libassuan
ntbtls
gnupg
EOS
