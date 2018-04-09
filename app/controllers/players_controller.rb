class PlayersController < ApplicationController
  def show
    player = Player.find( params[ "id" ] )
    info = {
      name_brief: player.name_brief,
      first_name: player.firstname,
      last_name: player.lastname,
      position: player.position,
      age: player.age,
      average_position_age_diff: player.age_diff
    }

    respond_to do | format |
      format.html
      format.json { render json: info }
    end
  end
end
