FROM ruby:3.3-alpine as builder
RUN apk add build-base
COPY Gemfile* ./
RUN bundle install

FROM ruby:3.3-alpine as runner

WORKDIR /usr/src/app

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

COPY src/ .
COPY .env ./.env
COPY .env.test ./.env.test

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]