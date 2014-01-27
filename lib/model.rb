include Mongo

configure do
  #work out why i cant put the settings here
end

def get_all
  client = MongoClient.new
  db = client['password_manager']
  coll = db['passwords']

  sites = coll.find.sort(:name).to_a
  sites_array = []

  sites.each do |site|
    sites_array << [site['name'], site['password']]
  end

  sites_array
end

def add_password(_name, _password)
  client = MongoClient.new
  db = client['password_manager']
  coll = db['passwords']

  coll.insert({ name: _name, password: _password })
end

def update_password(_name, _password)
  client = MongoClient.new
  db = client['password_manager']
  coll = db['passwords']

  coll.update({"name" => _name}, {"$set" => {"password" => _password}})
end

def delete_site
  settings.mongo.db['']
end