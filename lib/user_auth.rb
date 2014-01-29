include Mongo

helpers do
  def authorised?
    if not login?
      redirect '/'
    end
  end

  def login?
    if session[:name].nil?
      false
    else
      true
    end
  end

  def username
    session[:name]
  end

  def login (_username, _password)
    client = MongoClient.new
    db = client['password_manager']
    coll = db['users']

    if coll.find_one({username: _username, password: _password })
      session[:name] = _username #eventually get name from document
      true
    else
      false
    end
  end


  def logout
    session[:name] = nil
  end
end