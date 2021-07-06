#!/bin/sh

OUTDIR=_out
DOCSDIR=docs
DEFAULT_TARGET=default
BASEDIR=$(dirname $0)

function main {
  if [ "$1" == "" ]; then
    TARGET=$DEFAULT_TARGET
  else
    TARGET=$1
  fi
  
  $TARGET
}

function build {
  echo "----  Run Build"
  mkdir -p $OUTDIR
  cd $OUTDIR
  cmake ..
  make
  echo "----  Complete Build"
}

function tests {
  echo "----  Run Test"
  cd $OUTDIR
  ctest --output-on-failure
  echo "----  Complete Test"
}

function docs {
  echo "----  Run Document generation"
  cd $BASEDIR
  doxygen doxyfile
  echo "----  Complete Document generation"
}

function clean {
  rm -rf $OUTDIR
}

function default {
  build && tests
}

function publish {
  docs
  mkdir -p $DOCSDIR
  cp -R $OUTDIR/docs/html/* $DOCSDIR
}

cd $BASEDIR
main $*