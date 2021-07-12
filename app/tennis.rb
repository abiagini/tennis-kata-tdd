require_relative 'player_score'

class Tennis
  SCORES = { 0 => "Love", 1 => "15", 2 => "30", 3 => "40" }

  def initialize
    @server_player_score = PlayerScore.new
    @receiver_player_score = PlayerScore.new
  end

  def score
    return "Deuce" if deuce?
    return "Advantage in" if server_player_has_advantage?
    return "Advantage out" if receiver_player_has_advantage?
    return "Server player wins the game" if server_player_wins?
    return "Receiver player wins the game" if receiver_player_wins?
    "#{SCORES[@server_player_score.score]}-#{SCORES[@receiver_player_score.score]}"
  end

  def won_point player: :server
    @server_player_score.won_point if player == :server
    @receiver_player_score.won_point if player == :receiver
  end

  protected

    def deuce?
      @server_player_score.deuce? opponent: @receiver_player_score
    end

    def server_player_has_advantage?
      @server_player_score.has_advantage? opponent: @receiver_player_score
    end

    def receiver_player_has_advantage?
      @receiver_player_score.has_advantage? opponent: @server_player_score
    end

    def server_player_wins?
      @server_player_score.winner? opponent: @receiver_player_score
    end

    def receiver_player_wins?
      @receiver_player_score.winner? opponent: @server_player_score
    end
end