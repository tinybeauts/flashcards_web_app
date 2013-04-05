get "/rounds" do
  @rounds = current_user.rounds.all
end

get "/round/:id/guess" do
  @message = params[:message]

  @guess = Round.find(params[:id]).guesses.remaining.sample
  hold_guess(@guess)
  @card = @guess.card
  erb :"round/show"
end

post "/round/:id/guess" do
  @guess = current_guess
  @guess.attempt!(params[:attempt])
  session[:errors] = @guess.errors unless @guess.valid?
  redirect to(url)
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

