include Mongo

client = MongoClient.new
db = client['password_manager']
coll = db['passwords']

Given(/^'(.*)' does not already exist$/) do |site|
	if coll.find_one(:name => site)
		coll.remove(:name => site)

		puts "removed facebook"
	end
end

Given(/^'(.*)' does already exist$/) do |site|
	if not coll.find_one(:name => site)
		coll.insert({:name => site, :password => 'password'})

		"added facebook"
	end
end