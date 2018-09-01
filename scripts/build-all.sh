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
texinfo

### library
zlib
bzip
xz
ncurses
gettext
readline
expat
openssl
curl
sqlite3
libffi

### gcc
#gmp
#mpfr
#mpc
#gcc

### git
git
tig

### language
lua
python
python-packages
ruby

### vim
vim

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

### util
libxml2
tar
p7zip
global
highway
multitail
parallel
rlwrap
nkf
jq
bc
EOS
