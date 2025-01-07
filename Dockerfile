FROM ruby:3.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY src/ .
COPY .env ./.env
COPY .env.test ./.env.test
RUN bundle install

COPY . .

RUN hanami assets compile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]