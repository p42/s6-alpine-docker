#!/usr/bin/with-contenv bash

# Shell Colors
set_shell_error() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[5m" # Style: blink
  echo -e "\e[31m" # Text Color: Red
}

set_shell_info() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[33m" # Text Color: Yellow
}

set_shell_pass() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[32m" # Text Color: Green
}

set_shell_warning() {
  echo -e "\e[1m" # Style: bold
  echo -e "\e[35m" # Text Color: Magenta
}

reset_shell() {
  echo -e "\e[0m" # Reset all shell attributes
}

# Check to see if packages are preinstalled
PERL_INSTALLED=`apk info | grep ^perl$ | wc -l`
if [ ${PERL_INSTALLED} -eq 1 ]; then

  set_shell_info
  echo "perl already installed skipping step"
  reset_shell

  PERL_INSTALLED=true
else
  PERL_INSTALLED=false
fi

FORTUNE_INSTALLED=`apk info | grep ^fortune$ | wc -l`
if [ $FORTUNE_INSTALLED -eq 1 ]; then

  set_shell_info
  echo "fortune already installed skipping step"
  reset_shell

  FORTUNE_INSTALLED=true
else
  FORTUNE_INSTALLED=false
fi

if [ -e /usr/local/bin/cowsay ]; then

  set_shell_info
  echo "cowsay already installed skipping step"
  reset_shell

  COWSAY_INSTALLED=true
else
  COWSAY_INSTALLED=false
fi

#Make sure packages can be installed
if ! $PERL_INSTALLED; then
  apk add --no-cache perl
  if [ $? -ne 0 ]; then

    set_shell_error
    echo "TEST: installation of perl FAILED"
    reset_shell

    exit 1
  fi
fi

if ! $FORTUNE_INSTALLED; then
  apk add --no-cache fortune
  if [ $? -ne 0 ]; then

    set_shell_error
    echo -e "TEST: installation of fortune FAILED"
    reset_shell

    exit 1
  fi
fi

if ! $COWSAY_INSTALLED; then
  cd /tmp || exit 1
  wget https://web.archive.org/web/20120213192534/http://www.nog.net/~tony/warez/cowsay-3.03.tar.gz
  tar -xzf cowsay-3.03.tar.gz
  rm cowsay-3.03.tar.gz
  cd cowsay-3.03/ || exit 1
  ./install.sh /usr/local/
  cd || exit 1
  rm -r /tmp/cowsay-3.03
  if [ ! -e /usr/local/bin/cowsay ]; then

    set_shell_error
    echo "TEST: installation of cowsay FAILED"
    reset_shell

    exit 1
  fi
fi

fortune | cowsay -n
if [ $? -ne 0 ]; then

  set_shell_error
  echo "TEST: really.. you got this far and cowsay FAILED"
  reset_shell

  exit 1
fi


# Clean up time
if ! $COWSAY_INSTALLED; then

  set_shell_info
  echo "uninstalling cowsay"
  reset_shell

  rm /usr/local/man/man1/cowsay.1
  rm /usr/local/man/man1/cowthink.1
  rm /usr/local/bin/cowsay
  rm /usr/local/bin/cowthink
  rm -r /usr/local/share/cows
fi

if ! $FORTUNE_INSTALLED; then

  set_shell_info
  echo "uninstalling fortune-mod"
  reset_shell

  apk del -q fortune
fi

if ! $PERL_INSTALLED; then

  set_shell_info
  echo "uninstalling perl"
  reset_shell

  apk del -q perl
fi

exit 0
