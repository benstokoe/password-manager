include Mongo

helpers do

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

    if coll.find_one(:name => _name)
      false
    else
      coll.insert({ name: _name, password: _password })
      true
    end
  end

  def update_password(_name, _password)
    client = MongoClient.new
    db = client['password_manager']
    coll = db['passwords']

    coll.update({:name => _name}, {"$set" => {:password => _password}})
  end

  def delete_site(_name)
    client = MongoClient.new
    db = client['password_manager']
    coll = db['passwords']

    coll.remove(:name => _name)
  end
end