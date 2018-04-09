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
    position = self.position
    sport_id = self.sport_id
    same_position_players = Player.where( position: position, sport_id: sport_id )
    ages = same_position_players.collect { | player | player.age }.compact
    sum_of_ages = ages.inject( 0 ) { | sum, x | sum + x }
    avg_position_age = sum_of_ages / ages.count
    avg_position_age - self.age
  end
end
