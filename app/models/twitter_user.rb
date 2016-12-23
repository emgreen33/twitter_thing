require 'twitter'
class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['consumer_key']
      config.consumer_secret = ENV['consumer_secret']
      config.access_token = ENV['access_token']
      config.access_token_secret = ENV['access_secret']
    end
  end

  def refresh_tweets
    self.tweets.destroy_all
    client.user_timeline(handle, count: 15).each do |tweet|
      self.tweets.create(full_text: tweet.full_text, twitter_id: tweet.id)
    end
  end

  def fresh_tweets?
    return false if self.tweets.empty?
    self.tweets.first.created_at >= 1.minute.ago
  end

end
