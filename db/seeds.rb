


def deck_name(filename)
  pretty_name = filename.gsub(/\w{2}\//,'').gsub(/\.\w{3}/, '').split('_')
  pretty_name = pretty_name.map { |word| word.capitalize }.join(' ')
end

def make_deck(filename)
  file = File.read(filename).split("\n")
  deck = Deck.create(:name => deck_name(filename) )
  file.each do |card|
    q_a = card.split(',')
    deck.cards << Card.create(:question => q_a[0],
                           :answer   => q_a[1])
  end
end

make_deck("db/state_capitals.txt")
make_deck("db/us_presidents.txt")

# user = User.create(:name     => "Abraham Lincoln",
#                 :email    => "honestabe@gmail.com",
#                 :password => "123")

# deck = Deck.create(:name => "USA")
# user.decks << deck

# cards = [Card.create(:question => "Alabama?",
#                   :answer   => "Montgomery"),
#          Card.create(:question => "Alaska?",
#                   :answer   => "Juneau"),
#          Card.create(:question => "Arizona?",
#                   :answer   => "Phoenix"),
#          Card.create(:question => "Arkansas?",
#                   :answer   => "Little Rock"),
#          Card.create(:question => "California?",
#                   :answer   => "Sacramento"),
#          Card.create(:question => "Colorado?",
#                   :answer   => "Denver"),
#          Card.create(:question => "Connecticut?",
#                   :answer   => "Hartford"),
#          Card.create(:question => "Delaware?",
#                   :answer   => "Dover")]
# cards.each do |card|
#   deck.cards << card
# end

# round = Round.create(:choosen_deck => deck)
# user.rounds << round

