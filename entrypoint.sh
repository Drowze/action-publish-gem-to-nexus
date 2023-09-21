#!/bin/sh
set -eo pipefail

URL=$1
USERNAME=$2
PASSWORD=$3

[ -z "${URL}" ] && { echo "Missing input.url!"; exit 2; }
[ -z "${USERNAME}" ] && { echo "Missing input.username!"; exit 2; }
[ -z "${PASSWORD}" ] && { echo "Missing input.password!"; exit 2; }

read -r GEM_NAME GEM_VERSION < <(ruby -e "spec = Dir.entries('.').find { |file| file =~ /.*\.gemspec/ }.then(&Gem::Specification.method(:load)); puts [spec.name, spec.version].join(' ')")

echo "name=${GEM_NAME}" >> ${GITHUB_OUTPUT}

echo "::group::Building the gem"
gem build *.gemspec
echo "::endgroup::"

echo "::group::Pushing gem to Nexus"
gem nexus --url ${URL} --credential ${USERNAME}:${PASSWORD} *.gem
echo "::endgroup::"

# full version is only present if nexus doesn't throw an error
echo "full-version=${GEM_VERSION}" >> ${GITHUB_OUTPUT}
echo "::notice ::Published gem ${GEM_NAME}, version ${GEM_VERSION} to Nexus"
