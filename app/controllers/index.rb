get '/tweet' do
  # Look in app/views/index.erb
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

  erb :tweet_now
end

post '/tweet/new' do
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
