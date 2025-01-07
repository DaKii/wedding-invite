FROM ruby:3.3-alpine as builder
RUN apk add build-base
COPY Gemfile* ./
RUN bundle install

FROM ruby:3.3-alpine as runner

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY src/ .
COPY .env ./.env
COPY .env.test ./.env.test

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]