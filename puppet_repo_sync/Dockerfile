FROM ruby
RUN gem install sinatra json git
COPY files /
WORKDIR /sinatra
CMD ./webhook.rb
