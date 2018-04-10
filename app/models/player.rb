class Player < ApplicationRecord
  belongs_to :sport
  has_many :icons

  def name_brief
    sport = self.sport.sport

    if sport == "basketball"
      return "#{ self.firstname } #{ self.lastname[ 0 ] }."
    elsif sport == "baseball"
      return "#{ self.firstname[ 0 ] }. #{ self.lastname[ 0 ] }."
    elsif sport == "football"
      return "#{ self.firstname[ 0 ] }. #{ self.lastname }"
    end
  end

  def age_diff
    return "" if self.age.nil?
    same_position_players = Player.where( position: self.position, sport_id: self.sport_id )
    average = same_position_players.average( :age ).to_i
    self.age - average
  end
end
