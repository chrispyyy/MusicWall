# Homepage (Root path)
get '/' do
  erb :index
end

# # Homepage (Root path)
# get '/' do
#   @title = 'Share your favorite tracks'
#   @song = Song.all.order(points: :desc)
#   erb :'tracks/index'
# end

get '/posts/new' do
  @title = 'Post your favorite songs!!! YEAAA!!!'
  @song = Song.new
  erb :'posts/new'
end

get '/tracks' do
  @title = 'Share your favorite tracks'
  @tracks = Track.all.order(points: :desc)
  erb :'tracks/index'
end

get '/tracks/new' do
  @title = 'Post your favorite tracks'
  @track = Track.new
  erb :'tracks/new'
end

post '/tracks' do
  if @auth_user
    author = @auth_user.name
    user_id = @auth_user.id
  else
    author = params[:author]
    user_id = nil
  end
  @track = Track.new(
    song_title: params[:song_title],
    author: author,
    url: params[:url],
    user_id: user_id
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/tracks/:id' do
  @track = Track.find(params[:id])
  @title = "#{@track.song_title} by #{@track.author}"
  @all_tracks = Track.where(author: @track.author).where.not(id: params[:id])
  @review = Review.new
  erb :'tracks/show'
end
