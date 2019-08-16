FROM ruby:latest

RUN apt-get update -qq && apt-get install -y build-essential nodejs

WORKDIR /usr/app

COPY ./Gemfile  ./
COPY ./Gemfile.lock ./
COPY ./archiver ./archiver

RUN gem install bundler

RUN bundle install

COPY ./entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]


CMD ["rails", "server", "-b", "0.0.0.0"]