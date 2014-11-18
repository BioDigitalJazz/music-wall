# Homepage (Root path)

enable :sessions

helpers do
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end

get '/' do
  redirect '/songs'
end

get '/songs' do
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/user/new' do
  erb :'user/new'
end

post '/user/new' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    redirect '/songs'
  else
    redirect 'user/new'
  end
end

post '/songs/new' do
  @track = Track.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url],
    user_id: session[:user_id]
    )
  if @track.save
    redirect '/songs'
  else 
    redirect '/songs/new'
  end
end

post '/songs/upvote/:track_id' do
  if Upvote.where(track_id: params[:track_id], user_id: session[:user_id]) == []
    Upvote.create(track_id: params[:track_id], user_id: session[:user_id])
  end
  redirect '/songs'
end

post '/logout' do
  session.clear
  redirect '/songs'
end

post '/login' do
  @user = User.where(username: params[:username], password: params[:password]).first

  if @user 
    session[:user_id] = @user.id
    redirect '/songs'
  else
    redirect '/'
  end
end