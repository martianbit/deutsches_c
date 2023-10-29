#!/bin/bash

cat "$1" | dcc-preproc | gcc -x c - ${@:2}

