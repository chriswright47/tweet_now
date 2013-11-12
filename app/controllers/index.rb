get '/tweet' do
  erb :tweet_now
end

get '/' do
  erb :index
end

get '/request' do
  redirect request_token.authorize_url
end

get '/auth' do
  get_access_token
  # we now have a session[:token] and session[:secret],
  # so we try to find them in the db
  @user = User.where("token = :token AND secret = :secret", {token: session[:token], secret: session[:secret]}).first
  # if they are not in our db, we create them there
  unless @user
    @user = User.create(token: session[:token], secret: session[:secret])
  end
  # send @user data to view tweet_now.erb
  erb :tweet_now
end

post '/tweet/new' do
  @user = User.find(params[:user_id])
  tweet = client.update(params[:text])
  if tweet
    @tweet = tweet.text
    erb :success, :layout => false
  else
    status 500
    'Something bad happened :('
  end
end

get '/signout' do
  session.clear
  redirect '/'
end

# get '/future_tweet' do
#   erb :future_tweet
# end
