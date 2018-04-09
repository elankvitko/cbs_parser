class HomeController < ApplicationController
  def index
    params[ 'sport' ].nil? ? @sport = Sport.find_by( sport: 'basketball' ) : @sport = Sport.find_by( sport: params[ 'sport' ] )
    @players = Player.where( sport: @sport )
    @options = Sport.where( 'sport != ?', @sport.sport ).map { | sport | sport.sport }
  end
end
