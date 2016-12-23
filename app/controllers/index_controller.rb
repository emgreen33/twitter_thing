get '/' do
  @users = TwitterUser.all
  erb :'index'
end

post '/' do
  twitter_handle = params[:twitter_handle]
  TwitterUser.find_by(handle: twitter_handle)
  redirect "/#{twitter_handle}"
end

get '/:twitter_handle' do
  @user = TwitterUser.find_by(handle: params[:twitter_handle])
  if @user
    @tweets = @user.tweets
    unless @user.fresh_tweets?
      @user.refresh_tweets
      @tweets = @user.tweets
    end
  else
    @user = TwitterUser.create(handle: params[:twitter_handle])
    @user.refresh_tweets
    @tweets = user.tweets
  end
  erb :'tweets'
end

post '/tweet' do
  @user = TwitterUser.find_by(handle: params[:twitter_handle])
  @user.client.update(params[:tweet_body])
  @user.tweets.create(full_text: params[:tweet_body])
  redirect "/#{@user.handle}"
end

post '/filtered_tweet' do
  @user = TwitterUser.find_by(handle: params[:twitter_handle])
  @tweets = @user.search_words(params[:filter_tweet])
  erb :'tweets'
end


