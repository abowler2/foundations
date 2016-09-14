VALUES = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'].freeze
SUITS = ["Hearts", 'Diamonds', 'Clubs', 'Spades'].freeze

MAX_NUM = 21
DEALER_STAY = 17

def initalize_deck
  SUITS.product(VALUES).shuffle
end

def display_player_hand(cards)
  hand = []
  cards.each do |card|
    hand << "#{card[1]} of #{card[0]}"
  end
  last_card = hand.pop
  if !hand.empty?
    "#{hand.join(', ')} and #{last_card}"
  else
    last_card
  end
end

def display_dealer_hand(dealer_hand)
  cards = "Dealer has #{dealer_hand[0][1]} of #{dealer_hand[0][0]} and ??"
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
    elsif value.to_i.zero?
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > MAX_NUM
  end

  sum
end

def busted?(cards)
  total(cards) > MAX_NUM
end

def detect_result(dealer_hand, player_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if player_total > MAX_NUM
    :player_busted
  elsif dealer_total > MAX_NUM
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_score(dealer_wins, player_wins)
   prompt "Score: Player = #{player_wins}   Dealer = #{dealer_wins}"
end

def winner?(dealer_wins, player_wins)
  [dealer_wins, player_wins].include?(5)
end

def display_match_winner(dealer_wins, player_wins)
  if dealer_wins == 5
    prompt "Dealer won the match!"
  elsif player_wins == 5
    prompt "You won the match!"
  end
end

def display_result(dealer_hand, player_hand)
  result = detect_result(dealer_hand, player_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "---------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_end_of_round(dealer_hand, player_hand)
  puts "======================="
  prompt "Dealer has #{display_player_hand(dealer_hand)}"
  prompt "Dealer total is: #{total(dealer_hand)}"
  prompt "Your total is: #{total(player_hand)}"
  puts "======================="

  display_result(dealer_hand, player_hand)
end

def clear_screen
  system('clear') || system('cls')
end
  player_wins = 0
  dealer_wins = 0
# begin game
loop do
  clear_screen
  prompt "Welcome to #{MAX_NUM}!"
  display_score(dealer_wins, player_wins)

  deck = initalize_deck
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deck.slice!(0)
    dealer_hand << deck.slice!(0)
  end

  prompt display_dealer_hand(dealer_hand)
  prompt "You have #{display_player_hand(player_hand)}, for a total of #{total(player_hand)}."

  puts "=================="

  loop do
    player_turn = nil
    loop do
      prompt "Do you want to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if player_turn.start_with?('s', 'h')
      prompt "That is not a valid choice. Please choose 'h' or 's'"
    end

    if player_turn.start_with?('h')
      player_hand << deck.slice!(0)
      prompt "You chose to hit!"
      prompt "Your cards are now #{display_player_hand(player_hand)}"
      prompt "Your total is now #{total(player_hand)}"
    end

    break if player_turn == 's' || busted?(player_hand)
  end

  if busted?(player_hand)
    display_end_of_round(dealer_hand, player_hand)
    sleep(6)
    dealer_wins += 1
    winner?(dealer_wins, player_wins) ? break : next
  else
    prompt "You stayed at #{total(player_hand)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_hand) || total(dealer_hand) >= DEALER_STAY

    prompt "Dealer hits!"
    dealer_hand << deck.slice!(0)
    prompt "Dealer's total is now #{total(dealer_hand)}"
  end

  dealer_total = total(dealer_hand)
  if busted?(dealer_hand)
    display_end_of_round(dealer_hand, player_hand)
    sleep(6)
    player_wins += 1
    winner?(dealer_wins, player_wins) ? break : next
  else
    prompt "Dealer stays at #{dealer_total}"
  end
  
  sleep(3)

  # both players stay
  display_end_of_round(dealer_hand, player_hand)
  sleep(6)
  result = detect_result(dealer_hand, player_hand)
  case result
  when :dealer
    dealer_wins += 1
  when :player
    player_wins += 1
  end

  break if winner?(dealer_wins, player_wins)
end

clear_screen
display_match_winner(dealer_wins, player_wins)
display_score(dealer_wins, player_wins)
prompt "Thank you for playing #{MAX_NUM}! Good Bye!"
