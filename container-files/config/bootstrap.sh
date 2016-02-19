#!/bin/sh

set -e

#User params

#Internal params
if [ -z "$COMMAND" ]; then
	RUN_CMD="echo Hello World!, What where you expecting?" 
else
	RUN_CMD=${COMMAND}
fi

# Test for Interactiveness
if test -t 0; then
  $RUN_CMD

  if [[ $@ ]]; then 
    eval $@
  else 
    export PS1='[\u@\h : \w]\$ '
    /bin/bash
  fi

else
  if [[ $@ ]]; then 
    eval $@
  fi
  $RUN_CMD
fi
