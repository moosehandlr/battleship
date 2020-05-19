class Player
  attr_reader :player_type,
              :board

  def initialize (player_type, board)
    @player_type = player_type
    @board = board

  end

  def has_lost?

  end
end
