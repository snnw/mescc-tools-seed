#!/usr/bin/env bash
set -ex
set -euo pipefail

for t in *.hex0; do
    ../hex0 $t out
    diff -u <(xxd out) outputs/$t

    ../hex1 $t out
    diff -u <(xxd out) outputs/$t

    diff -u <(../hex2-0 $t | xxd) outputs/$t
done

for t in *.hex1; do
    ../hex1 $t out
    diff -u <(xxd out) outputs/$t

    diff -u <(../hex2-0 $t | xxd) outputs/$t
done
