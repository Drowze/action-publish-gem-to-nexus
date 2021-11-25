#!/bin/sh

URL=$1
USERNAME=$2
PASSWORD=$3

[ -z "${URL}" ] && { echo "Missing input.url!"; exit 2; }
[ -z "${USERNAME}" ] && { echo "Missing input.username!"; exit 2; }
[ -z "${PASSWORD}" ] && { echo "Missing input.password!"; exit 2; }

gem build *.gemspec
gem nexus --url ${URL} --credential ${USERNAME}:${PASSWORD} *.gem
