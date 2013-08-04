class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)
  if game.length != 2
    raise WrongNumberOfPlayersError
  end

  move1 = game[0][1].downcase
  move2 = game[1][1].downcase

  #if (move1 != "r" || move1 != "p" || move1 != "s" || move2 !="r" || move2 != "p" || move2 != "s")
  #	raise NoSuchStrategyError
  #nd

  if (move1 == move2)
  	return game[0];
  elsif (move1 == "r" && move2 == "p")
  	return game[1]
  elsif (move1 == "r" && move2 == "s")
  	return game[0]
  elsif (move1 == "p" && move2 == "r")
  	return game[0]
  elsif (move1 == "p" && move2 == "s")
  	return game[1]
  elsif (move1 == "s" && move2 == "r")
  	return game[1]
  elsif (move1 == "s" && move2 == "p")
  	return game[0]
  else
  	raise NoSuchStrategyError;
  end
end

def rps_tournament_winner(tournament)
  # If the element's 1st inner element is a string, we've reached the innermost part of the array, a proper game.
  if tournament[0][0].is_a?(String)
  	return rps_game_winner(tournament)
  else
  	return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  end
end


tournament = [
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]

