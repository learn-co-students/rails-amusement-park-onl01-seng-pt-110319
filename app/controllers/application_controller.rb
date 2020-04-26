class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def login_required
  end
end
