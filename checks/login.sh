#!/bin/sh
# guest / guest logs in (the database was imported at start) and reaches single-user mode.
set -e
jar=$(mktemp)
curl -fsS -c "$jar" -b "$jar" -o /dev/null http://web/user/login
curl -fsS -c "$jar" -b "$jar" -o /dev/null --data "Username=guest&Password=guest" http://web/user/login
page=$(curl -fsSL -c "$jar" -b "$jar" http://web/mode/single/challenges/HTTPBasics)
echo "$page" | grep -qi "logout"
