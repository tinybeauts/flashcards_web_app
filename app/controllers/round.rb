# get "/rounds" do
#   @rounds = current_user.rounds.all
# end

post "/rounds/new" do
  deck = Deck.find(params[:deck_id])
  round = current_user.rounds.create(:choosen_deck => deck)
  redirect to("/round/#{round.id}/guess") 
end

get "/round/:id/guess" do
  @errors = session[:errors]
  round = Round.find(params[:id]).guesses.remaining
  unless round.empty?
    @guess = round.sample
    hold_guess(@guess)
    @card = @guess.card
    erb :"round/show"
  else
    redirect to("/decks")
  end
end

post "/round/:id/guess" do
  round_id = params[:id]
  @guess = current_guess
  @guess.attempt!(params[:attempt])
  session[:errors] = @guess.errors unless @guess.valid?
  redirect to("/round/#{round_id}/guess")
end

helpers do
  def current_guess
    Guess.find(session[:guess_id])
  end
end

def hold_guess(guess)
  session[:guess_id] = guess.id
end



#get /round/:id/guess <- put the guess into session
#post /round/:id/guess

  # @card = @guess.card
  # if params[:attempt] == @card.answer
  #   @guess.correct = true
  # else
  #   url<<"?message=incorrect"
  # end

