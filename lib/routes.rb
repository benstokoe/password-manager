passwords = {

    :amazon => {:name => 'Amazon', :password => 'password'},
    :ebay => {:name => 'eBay', :password => 'password'},
    :paypal => {:name => 'PayPal', :password => 'password'}

}

get '/' do
  puts passwords

  sites_array = []

  passwords.each do |name, meta|
    sites_array << [meta[:name], meta[:password]]
  end

  haml :index, :locals => {:sites => sites_array}
end

get '/add' do
  haml :add
end

post '/add' do
  site = params[:site_name]
  password = params[:password]

  passwords[site.downcase.to_sym] = {
      :name => site, :password => password
  }

  puts passwords.to_s

  redirect '/'
end