class User < ActiveRecord::Base
  has_many :rides 
  has_many :attractions, through: :rides
  has_secure_password
  
  def mood
    unless admin
      happiness.to_i < nausea.to_i ? "sad" : "happy"
    end 
  end 
end
