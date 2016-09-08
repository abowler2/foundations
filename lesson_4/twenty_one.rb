VALUES = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
SUITS = ["hearts", 'diamonds', 'clubs', 'spades']


def initalize_deck
  SUITS.product(VALUES).shuffle
end

def prompt(msg)
  puts "=> #{msg}"
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else 
      sum += value.to_i
    end
  end
    values.select { |value| value == "A"}.count.times do
      sum -= 10 if sum > 21
    end

    sum
end



 deck = initalize_deck
 player_hand = []
 dealer_hand = []
 
2.times do 
  player_hand << deck.slice!(0)
  dealer_hand << deck.slice(0)
end

prompt "Dealer has #{dealer_hand[0]} and ?"
prompt "You have #{player_hand[0]} and #{player_hand[1]}, for a total of #{total(player_hand)}."

  # deal two cards from the 'top' of the deck and then
  # delete those cards from the array so they are not redrawn (.slice! or .pop)
