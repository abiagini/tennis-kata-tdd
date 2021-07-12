class Tennis
  SCORES = { 0 => "Love", 1 => "15", 2 => "30", 3 => "40" }

  def initialize
    @server_player = 0
    @receiver_player = 0
  end

  def score
    return "Deuce" if @server_player == @receiver_player && @server_player >= 3
    return "Server player wins the game" if @server_player >= 4 && (@server_player - @receiver_player) >= 2
    return "Receiver player wins the game" if @receiver_player >= 4 && (@receiver_player - @server_player) >= 2
    return "Advantage in" if @server_player - @receiver_player == 1 && @server_player >= 4
    return "Advantage out" if @receiver_player - @server_player == 1 && @receiver_player >= 4
    "#{SCORES[@server_player]}-#{SCORES[@receiver_player]}"
  end

  def won_point player: :server
    @server_player += 1 if player == :server
    @receiver_player += 1 if player == :receiver
  end
end