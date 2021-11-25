# Publish gem to nexus

Simple gitHub actions to build and publish gems to Sonatype's Nexus Repository.

## Inputs:

## `url`

**Required** The url to the Nexus repository.

## `username`

**Required** The username with write access to the Nexus repository.

## `password`

**Required** The password to the Nexus repository.

## Outputs:

## `full-version`

The full version string of the gem uploaded

## Usage
```yml
- name: Build and publish gem
  uses: Drowze/action-publish-gem-to-nexus@master
  with:
    url: http://nexus.my-domain.com/repository/my-gem
    username: johndoe
    password: ${{ secrets.NEXUS_PASSWORD }}
```

NOTE: This action is not official and has no relation with Sonatype.
