class PhotosController < Sinatra::Base

  #sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $photos = [{
	 id: 0,
	 title: "Photo 1",
	 body: "This is the first photo",
   url: "https://http.cat/403"
  },
  {
    id: 1,
    title: "Photo 2",
    body: "This is the second photo",
    url: "https://http.cat/100"
  },
  {
    id: 2,
    title: "Photo 3",
    body: "This is the third photo",
    url: 'https://http.cat/426'
  }];

  get "/" do
    @title = "Photo Homepage"
    erb :'photos/home'
  end

  get "/photos" do
    @title = "Photos"
    @photos = $photos

    erb :'photos/index'
  end

  get "/photos/new" do
    @title = "New Photo"
    erb :'photos/new'
  end

  get "/photos/:id" do
    id = params[:id].to_i
    @photo = $photos[id]
    @title = "Photos page"
    erb :'photos/show'
  end

  get "/photos/:id/edit" do
    @title = "Edit Photo"
    id = params[:id]
    erb :'photos/edit'
  end

  post "/photos/" do
    "this creates a new photo"
  end

  put "/photos/:id" do
    id = params[:id]

    "This updates photo: #{id}"
  end

  delete "/photos/:id" do
    id = params[:id]

    "This destroys photo: #{id}"
  end
  # OR
  # put '/photos/:id' do
  #   "Delete: #{params[:id]}"
  # end

end
