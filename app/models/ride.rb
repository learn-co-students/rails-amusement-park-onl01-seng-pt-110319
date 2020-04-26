class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if (user.height < attraction.min_height) && (user.tickets < attraction.tickets) #too short AND no tickets
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.height < attraction.min_height #hieght is less the ride hieght
            return "Sorry. You are not tall enough to ride the Roller Coaster."
        elsif user.tickets < attraction.tickets #does not have enough tickets
            return "Sorry. You do not have enough tickets to ride the Roller Coaster."
        else
            #update tickets and mood AND tell them to enojy ride.
            user.tickets = user.tickets - attraction.tickets
            user.happiness = user.happiness + attraction.happiness_rating
            user.nausea =  user.nausea + attraction.nausea_rating
            user.save
            return "Please enjoy your ride!"
        end
    end
end
