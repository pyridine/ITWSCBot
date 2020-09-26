FROM debian

RUN apt-get update && apt-get -y install -qqq cron openssl build-essential ruby-dev

COPY safe_words .
COPY tweet.rb .
COPY Gemfile.lock .
COPY Gemfile .
COPY env.config .
RUN gem install bundler --no-ri --no-rdoc
RUN bundle config set system 'true'
RUN bundle install
RUN chmod 0744 ./tweet.rb

ADD crontab /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron
RUN touch /var/log/cron.log
RUN apt-get update
RUN apt-get -y install cron

CMD cron && tail -f /var/log/cron.log