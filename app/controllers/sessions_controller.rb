class SessionsController < ApplicationController
  def create
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end
