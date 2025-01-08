FROM ruby:3.3 as builder
RUN apt update
COPY src/Gemfile* ./
RUN bundle install

FROM ruby:3.3 as runner

RUN apt update && apt install postgresql nodejs npm  -y

WORKDIR /usr/src/app

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

COPY src/ .
COPY .env ./.env
COPY .env.test ./.env.test

RUN npm install
RUN bundle exec hanami assets compile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

