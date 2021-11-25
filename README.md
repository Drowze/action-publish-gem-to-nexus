# Publish gem to nexus

Simple gitHub actions to build and publish gems to Sonatype's Nexus Repository.

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
