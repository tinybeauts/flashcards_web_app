get "/rounds" do
  @rounds = current_user.rounds.all
end

get "/round/:id" do
  @card = Round.find(:id).remaining_cards.sample
  erb :"round/show"
end

post "/round/:id" do
  current_round = current_user.rounds.find(:id)
  card = current_round.guesses.find(params[:card][:id])
  card.guess(params[:card][:guess])
  id = params[:guess]
  redirect to("/round/#{id}")
end
