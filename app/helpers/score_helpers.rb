def get_round(guess)
  round_id = guess.round_id
  round = Round.find(round_id)
end

def get_user(guess)
  round = get_round(guess)
  user_id = @round.user_id
  user = User.find(user_id)
end

def increment_guess_total(guess)
  round = get_round(guess)
  round.increment!(:guess_total, by = 1)
end

def current_score

end

def final_score(round_id)
  round = Round.find(round_id)
  total_cards = round.cards.size
  total_guesses = round.guess_total
  score = ((total_cards.to_f / total_guesses) * 100).to_i
  user = User.find(round.user_id)
  user.score = score
  user.save
end