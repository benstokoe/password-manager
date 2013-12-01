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

def add_password(name, password)
  settings.mongo_db['passwords'].insert({
      name: name,
      password: password
  })
end