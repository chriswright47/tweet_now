class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    user = tweet.user

    client = Twitter::Client.new( :oauth_token => user.token, :oauth_token_secret => user.secret)
    client.update(tweet.status)
  end
end

