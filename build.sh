#!/bin/bash
rm -rf docs/
flutter build web -o docs/ --release --base-href="/assignment3/"
