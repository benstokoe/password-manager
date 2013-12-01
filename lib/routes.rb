get '/' do
  sites_array = get_all

  haml :index, :locals => {:sites => sites_array}
end

get '/add' do
  haml :add
end

post '/add' do
  add_password(params[:site_name], params[:password])

  redirect '/'
end