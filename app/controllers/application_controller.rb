 require 'rack-flash'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  use Rack::Flash

  def home
  	render '/layouts/index'
  end

end
