
# def deck_name(filename)
#   pretty_name = filename.gsub(/\w{2}\//,'').gsub(/\.\w{3}/, '').split('_')
#   pretty_name = pretty_name.map { |word| word.capitalize }.join 
# end

# def make_deck(filename)
#   file = File.read(filename).split("\n")
#   deck = Deck.new(:name => deck_name(filename) )
#   file.each do |card|
#     q_a = card.split(',')
#     deck.cards << Card.new(:question => q_a[0],
#                            :answer   => q_a[1])
#   end
# end

# make_deck("db/state_capitals.txt")
# make_deck("db/us_presidents.txt")

# user = User.new(:name     => "Abraham Lincoln",
#                 :email    => "honestabe@gmail.com",
#                 :password => "123")

# user.decks << Deck.new(:name => "USA")

# user.decks.cards << Card.new(:question => "How old am I?",
#                              :answer   => "dead")

# user.decks.cards.guesses << Guess.new(:user_input => "42")

# user.rounds << Round.create()

# user.rounds.guesses << user.decks.cards.guesses
