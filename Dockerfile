FROM ruby:3.3.6-slim

ENV APP /rails
ENV BIN /usr/bin

WORKDIR $APP

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential \
      git \
      libpq-dev \
      pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY entrypoint.sh $BIN/
RUN chmod +x $BIN/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["./bin/dev"]
