get '/' do
	haml :login, :layout => false
end

get '/login' do
  haml :loginform, :layout => false
end

get '/passwords' do
  authorised?

  sites_array = get_all
  haml :index, :locals => {:sites => sites_array}
end

get '/add' do
  haml :add
end

post '/add' do
  if add_password(params[:site_name], params[:password])
    redirect '/passwords'
  else
    haml :errors, :locals => {:error => 'This site already exists'}
  end
end

get '/edit/:site' do |site|
  haml :edit, :locals => {:site => site}
end

post '/edit' do
  update_password(params[:site_name], params[:password])

  redirect '/passwords'
end

get '/delete/:site' do |site|
	delete_site(site)

  redirect '/passwords'
end	

get '/logout' do
  logout
  redirect '/'
end