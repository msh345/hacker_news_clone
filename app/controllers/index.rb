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



# POST ======================================

post '/login' do
end
