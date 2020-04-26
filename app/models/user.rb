class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.nausea > self.happiness #more nauseous than happy
            return "sad" 
        elsif self.nausea < self.happiness
            return "happy"
        else 
            return "We do not have your mood on file"
        end
    end
end
