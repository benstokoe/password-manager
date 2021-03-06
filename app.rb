$LOAD_PATH.unshift File.expand_path('lib')
require 'sinatra'
require 'mongo'
require 'model'
require 'user_auth'
require 'routes'
require 'haml'
require 'sinatra/assetpack'
require 'sinatra/support'
require 'sass'
require 'compass'

enable :sessions
set :session_secret, "password_manager"

register Sinatra::CompassSupport
c = Compass.configuration
c.project_path = settings.root
#c.images_dir = "app/images"
#c.http_generated_images_path = "/images
c.fonts_dir = "fonts"

set :root, File.dirname(__FILE__)
register Sinatra::AssetPack

assets {

	css :styles, [
		'/css/bootstrap/css/bootstrap.min.css',
		'/css/flat-ui/css/flat-ui.css',
		'/css/styles.css',
	]
	css :login, [
		'/css/bootstrap/css/bootstrap.min.css',
		'/css/flat-ui/css/flat-ui.css',
		'/css/login.css',	
	]

	css_compression :sass
}