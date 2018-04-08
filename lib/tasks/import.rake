namespace :import do
  desc "Import sports to database"
  task sports: :environment do
    sports = [ "baseball", "basketball", "football" ]
    sports.each { | sport | Sport.create( sport: sport ) if Sport.find_by( sport: sport ).nil? }
  end

  desc "Import and persist data from CBS sports"
  task cbs_data: :environment do
    require 'open-uri'
    sports = [ "baseball", "basketball", "football" ]

    sports.each do | sport |
      sport_id = Sport.find_by( sport: sport )
      raw = URI.parse( "http://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=#{ sport }&response_format=JSON" ).read
      data = JSON.parse( raw )

      data[ "body" ][ "players" ].each do | player |
        if player[ "icons" ] != nil
          icons = player.delete( "icons" )
        end

        player.delete( "id" )
        new_player = Player.new( player )
        new_player.sport_id = sport_id.id
        new_player.save

        if icons
          icons.each do | short, desc |
            Icon.create( short: short, desc: desc, player_id: new_player.id )
          end
        end
      end
    end
  end
end
