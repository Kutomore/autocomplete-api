FROM ruby:2.7.1-alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

RUN mkdir /autocomplete-api
WORKDIR /autocomplete-api

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
