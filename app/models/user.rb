class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets


  def tweet(status)
    tweet = tweets.create!(:status => status)
    TweetWorker.perform_async(tweet.id)
  end

  def future_tweet(status, time)
    tweet = tweets.create!(:status => status)
    TweetWorker.perform_in(time.hours, tweet.id)
  end
end
