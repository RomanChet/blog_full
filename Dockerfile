FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app12
WORKDIR /app12
ADD Gemfile /app12/Gemfile
ADD Gemfile.lock /app12/Gemfile.lock
RUN bundle install
ADD . /app12
RUN groupadd --gid 2000 app \
  && useradd --uid 2000 --gid app --shell /bin/bash --create-home app
USER app
