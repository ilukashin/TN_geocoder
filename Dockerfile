FROM ruby:2.7.3-alpine3.13

RUN apk add --no-cache \
  build-base \
  tzdata 

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem update bundler && \
  bundle config set without 'development test' && \
  bundle install --jobs 4

COPY . .


CMD ["bin/app"]
