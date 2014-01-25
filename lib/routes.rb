get '/' do
	haml :login, :layout => false
end

get '/passwords' do
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

get '/edit/:site' do |site|
  haml :edit, :locals => {:site => site}
end

post '/edit' do
  update_password(params[:site_name], params[:password])

  redirect '/'
end

post '/delete/:site' do |site|
	delete_site(site)
end	