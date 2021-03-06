#!/bin/sh
set -eo pipefail

URL=$1
USERNAME=$2
PASSWORD=$3

[ -z "${URL}" ] && { echo "Missing input.url!"; exit 2; }
[ -z "${USERNAME}" ] && { echo "Missing input.username!"; exit 2; }
[ -z "${PASSWORD}" ] && { echo "Missing input.password!"; exit 2; }

echo "Building gem"
gem build *.gemspec

GEM_VERSION=$(ruby -e "require 'rubygems'; gemspec = Dir.entries('.').find { |file| file =~ /.*\.gemspec/ }; spec = Gem::Specification::load(gemspec); puts spec.version")
echo "::set-output name=full-version::${GEM_VERSION}"

echo "Pushing gem"
gem nexus --url ${URL} --credential ${USERNAME}:${PASSWORD} *.gem
