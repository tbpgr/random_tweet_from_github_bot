# coding:utf-8

require 'dotenv'
require 'twitter'
require 'date'
require "yaml"
require "octokit"

class RandomTweetFromGitHubBot
  VERSION = '1.0.0'

  attr_accessor :client, :stream_client

  def initialize
    Dotenv.load
    @client = new_tweet_client_instance
    @stream_client = new_teetstreem_client_instance
    @message = load_message
  end

  def tweet(text)
    @client.update(text)
  end

  def random_advertise(twitter_id, tweet)
    return if twitter_id == ENV['TWITTER_ID']
    return if tweet.include?('@')
    return if rand > (ENV['PROBABILITY'].to_f)
    tweet("#{@message.sample} \n#{current_time}")
  end

  private

  def load_message
    encoded_tweet = Octokit.contents(ENV['ARTICLE_REPOSITORY'], :path => 'tweet.yml')
    decoded_tweet = Base64.decode64(encoded_tweet.attrs[:content])
    YAML.load(decoded_tweet) 
  end

  def new_tweet_client_instance
    Twitter::REST::Client.new { |config|auth(config) }
  end

  def new_teetstreem_client_instance
    ::Twitter::Streaming::Client.new { |config|auth(config) }
  end

  def auth(config)
    config.consumer_key         = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret      = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token         = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret  = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    config
  end
end

def current_time
  DateTime.now.strftime('%Y/%m/%d %H:%M:%S')
end

bot = RandomTweetFromGitHubBot.new
bot.stream_client.user do |message|
  next unless message.is_a?(::Twitter::Tweet)
  bot.random_advertise(message.attrs[:name], message.text)
end
