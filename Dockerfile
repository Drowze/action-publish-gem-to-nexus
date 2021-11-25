FROM ruby:2.7-alpine

# add git as it's a common practice to use git to select the gem files
RUN apk add --no-cache git

RUN gem install nexus

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
