require_relative '../app/tennis'

RSpec.describe Tennis do
  let(:tennis){ Tennis.new }

  it 'can score a new game when no one has scored' do
    expect(tennis.score).to eq 'Love-Love'
  end

  it 'a player can score once' do
    tennis.won_point

    expect(tennis.score).to eq '15-Love'
  end

  it 'a player can score twice' do
    2.times { tennis.won_point }

    expect(tennis.score).to eq '30-Love'
  end

  it 'a player can score thrice' do
    3.times { tennis.won_point }

    expect(tennis.score).to eq '40-Love'
  end

  it 'receiver player can score' do
    expect(tennis.score).to eq 'Love-Love'

    tennis.won_point player: :receiver
    expect(tennis.score).to eq 'Love-15'

    2.times{ tennis.won_point player: :receiver }
    expect(tennis.score).to eq 'Love-40'
  end

  it 'server player wins the game when he scores fourice' do
    4.times { tennis.won_point }

    expect(tennis.score).to eq 'Server player wins the game'
  end

  it 'receiver player wins the game when he scores fourice' do
    4.times { tennis.won_point player: :receiver }

    expect(tennis.score).to eq 'Receiver player wins the game'
  end

  it 'the score is deuce when both players scores thrice' do
    3.times { tennis.won_point }
    3.times { tennis.won_point player: :receiver }

    expect(tennis.score).to eq 'Deuce'
  end

  it 'server player has advantage when score a point after deuce' do
    3.times { tennis.won_point }
    3.times { tennis.won_point player: :receiver }

    tennis.won_point

    expect(tennis.score).to eq 'Advantage in'
  end

  it 'server player wins the game when he scores after advantage' do
    3.times { tennis.won_point }
    3.times { tennis.won_point player: :receiver }

    2.times{ tennis.won_point }

    expect(tennis.score).to eq 'Server player wins the game'
  end

  it 'receiver player has advantage when score a point after deuce' do
    3.times { tennis.won_point }
    3.times { tennis.won_point player: :receiver }

    tennis.won_point player: :receiver

    expect(tennis.score).to eq 'Advantage out'
  end

  it 'receiver player wins the game when he scores after advantage' do
    3.times { tennis.won_point }
    3.times { tennis.won_point player: :receiver }

    2.times{ tennis.won_point player: :receiver }

    expect(tennis.score).to eq 'Receiver player wins the game'
  end

  it 'the score is deuce if the player without advantage wins the point' do
    3.times { tennis.won_point }
    3.times { tennis.won_point player: :receiver }

    tennis.won_point
    tennis.won_point player: :receiver

    expect(tennis.score).to eq 'Deuce'

    tennis.won_point player: :receiver
    expect(tennis.score).to eq 'Advantage out'

    tennis.won_point
    expect(tennis.score).to eq 'Deuce'
  end

end