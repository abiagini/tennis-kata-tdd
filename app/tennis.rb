class Tennis
  SCORES = { 0 => "Love", 1 => "15", 2 => "30", 3 => "40" }

  def initialize
    @server_player = 0
    @receiver_player = 0
  end

  def score
    return "Deuce" if deuce?
    return "Advantage in" if server_player_has_advantage?
    return "Advantage out" if receiver_player_has_advantage?
    return "Server player wins the game" if server_player_wins?
    return "Receiver player wins the game" if receiver_player_wins?
    "#{SCORES[@server_player]}-#{SCORES[@receiver_player]}"
  end

  def won_point player: :server
    @server_player += 1 if player == :server
    @receiver_player += 1 if player == :receiver
  end

  protected

    def deuce?
      @server_player == @receiver_player && @server_player >= 3
    end

    def server_player_has_advantage?
      @server_player - @receiver_player == 1 && @server_player >= 4
    end

    def receiver_player_has_advantage?
      @receiver_player - @server_player == 1 && @receiver_player >= 4
    end

    def server_player_wins?
      @server_player >= 4 && (@server_player - @receiver_player) >= 2
    end

    def receiver_player_wins?
      @receiver_player >= 4 && (@receiver_player - @server_player) >= 2
    end
end