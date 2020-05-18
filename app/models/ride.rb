class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    attraction = Attraction.find(attraction_id)
    user = User.find(user_id)
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    else
      if user.tickets < attraction.tickets
        "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      else
        if user.height < attraction.min_height
          "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
          user.tickets = user.tickets-attraction.tickets
          user.nausea = user.nausea + attraction.nausea_rating
          user.happiness = user.happiness + attraction.happiness_rating
          user.save
          "Thanks for riding the #{attraction.name}!"
        end
      end
    end
  end
end
