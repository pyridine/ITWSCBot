#!/usr/bin/env ruby
# https://stackoverflow.com/questions/11007111/ruby-whats-an-elegant-way-to-pick-a-random-line-from-a-text-file
require "twitter"

API_KEY = ENV["API_KEY"]
API_SECRET = ENV["API_SECRET"]
ACCESS_TOKEN = ENV["ACCESS_TOKEN"]
ACCESS_SECRET = ENV["ACCESS_SECRET"]
raise "missing API_KEY" if API_KEY.nil?
raise "missing API_SECRET" if API_SECRET.nil?
raise "missing ACCESS_TOKEN" if ACCESS_TOKEN.nil?
raise "missing ACCESS_SECRET" if ACCESS_SECRET.nil?
TWEET_URL = "https://api.twitter.com/1.1/statuses/update.json"

def pick_random_line(path)
  random_line = nil

  File.open(path) do |file|
    file_lines = file.readlines
    random_line = file_lines[Random.rand(0...file_lines.size)]
  end

  random_line.strip
end

def tweet(status)
  client = Twitter::REST::Client.new({
    consumer_key: API_KEY,
    consumer_secret: API_SECRET,
    access_token: ACCESS_TOKEN,
    access_token_secret: ACCESS_SECRET,
  })
  client.update(status)
end

word = pick_random_line("/safe_word")
status = "This word is spelled correctly: #{word}!"
tweet(status)
puts("[#{Time.now}] I tweeted \"#{status}\"")
