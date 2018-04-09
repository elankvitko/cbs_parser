class SportsController < ApplicationController
  def show
    sport = Sport.find( params[ "id" ] )
    players = sport.players

    info = {
      sport.sport => []
    }

    players.each do | player |
      info[ sport.sport ] << {
        name_brief: player.name_brief,
        first_name: player.firstname,
        last_name: player.lastname,
        position: player.position,
        age: player.age,
        average_position_age_diff: player.age_diff
      }
    end

    respond_to do | format |
      format.html
      format.json { render json: info }
    end
  end
end
