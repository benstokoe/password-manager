include Mongo

configure do
  conn = MongoClient.new("localhost", 27017)
  set :mongo_connection, conn
  set :mongo_db, conn.db('password_manager')
end

def get_all
  sites = settings.mongo_db['passwords'].find.to_a

  sites_array = []

  sites.each do |site|
    #puts site
    sites_array << [site['name'], site['password']]
  end

  sites_array
end

def add_password(_name, _password)
  settings.mongo_db['passwords'].insert({
      name: _name,
      password: _password
  })
end

def update_password(_name, _password)
  settings.mongo_db['passwords'].update(
      {"name" => _name},
      {"$set" => {"password" => _password}}
  )
end

def delete_site
  settings.mong
end