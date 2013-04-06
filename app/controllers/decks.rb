get '/decks/new' do
  erb :create_deck
end

post '/decks/new' do
  @deck = Deck.create(:name => params[:deck][:name])
  @cards = params[:deck][:cards].split("\n")
  
  @cards = @cards.map do |card|
    q_a = card.split(',')
    @deck.cards << Card.create(:question => q_a[0].chomp,
                               :answer   => q_a[1].chomp)
  end

  current_user.decks << @deck

  erb :decks

end
