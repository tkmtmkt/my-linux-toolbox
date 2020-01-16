#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

BASE_DIR=$(cd ${SCRIPT_DIR}/..;pwd)
LOG_DIR=${BASE_DIR}/log

[[ ! -d "${LOG_DIR}" ]] && mkdir ${LOG_DIR}

log "build-all at $(uname -a)"
while read PKG
do
  case ${PKG} in
    '')
      continue
      ;;
    '#'*)
      log "${PKG}"
      continue
      ;;
    *)
      echo -e "\n### build-${PKG}"
      time ${SCRIPT_DIR}/build-${PKG}.sh > ${LOG_DIR}/result-${PKG}-$(date +%Y%m%d%H%M).log 2>&1
      RESULT=$?
      if [[ ${RESULT} -eq 0 ]]; then
        echo "Success"
      else
        echo "Failure(${RESULT})"
        exit ${RESULT}
      fi
      ;;
  esac
done <<'EOS'
### base
cmake
bazel
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
libxml2
gettext
readline
expat
openssl
sqlite3
libffi
rsync
curl
tar
oniguruma

### OpenLDAP
cyrus-sasl
openldap

### GnuPG
libgpg-error
npth
libgcrypt
libksba
libassuan
ntbtls
gnupg

### git
git
tig

### language
julia
lua
python
ruby

### vim
vim

### tmux
libevent
tmux

### util
p7zip
pt
ripgrep
global
nkf
jq
fio
pwgen
direnv
rlwrap
parallel
multitail
fossil
ssh-chat
bc
taskwarrior
weechat
neomutt

### python-packages
python-packages
EOS
