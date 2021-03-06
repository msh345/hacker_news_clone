enable :sessions

# GET ======================================

get '/' do
  # Look in app/views/index.erb
  redirect '/news'
end

get '/news' do
  
  erb :index
end

get '/user/:id' do
  user_id = params[:id]
  @user = User.find(user_id)

  @username = @user.username
  @created_at = create_time_ago(@user.created_at)

  @posts = @user.posts
  @comments = @user.comments

  erb :user
end

get '/post/:id' do
  @post_id = params[:id]
  @post = Post.find(@post_id)
  @post_title = @post.title
  @post_url = @post.url
  @comments = @post.comments
  erb :post
end

get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  erb :index
end

get '/submit' do
  if session[:id] == nil
    @error = "To submit a post, you need to login or create an account"
    erb :login
  else

    erb :submit

  end

end




# POST ======================================

post '/login' do
  if params_has_blank?(params)
    @error = "You left a field blank. Please try again"
    erb :login
  elsif User.find_by_username(params[:username])
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect '/news'
    else
      @error = "Username and password do not match"
      erb :login
    end
  else
    @user = User.create(username: params[:username], password: params[:password])
    session[:id] = @user.id
    redirect '/news'
  end
end

post '/submit' do
  post = Post.create(title: params[:title], url: params[:url], user_id: session[:id])
  redirect "/post/#{post.id}"
end
