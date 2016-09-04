#Game of "Rock, Paper, Scissors, Spock, Lizard"

VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_COMBOS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'spock' => %w(scissors rock),
  'lizard' => %w(spock paper)
}

FIRST_LETTERS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  's' => 'spock',
  'l' => 'lizard'
}

def prompt(message)
  puts("=> #{message}")
end

def letter_choice(letter)
  FIRST_LETTERS[letter]
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def display_winner(player, computer)
  if player > computer
    puts "You win!!"
  elsif computer > player
    puts "Computer wins!"
  else
    "It's a tie!"
  end
end

prompt("Welcome to Rock, Paper, Scissors, Spock, Lizard!")
prompt("First one to win 5 games is the winner.")

player_wins = 0
computer_wins = 0
ties = 0

loop do
  choice = ''
  loop do
    beg_prompt = <<-MSG
    Please make your choice:
    'r' for rock
    'p' for paper
    'sc' for scissors
    's' for spock
    'l' for lizard
    MSG
    puts beg_prompt
    choice = gets.chomp.downcase
    choice = letter_choice(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  if win?(choice, computer_choice)
    player_wins += 1
  elsif win?(computer_choice, choice)
    computer_wins += 1
  else
    ties += 1
  end

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)
  prompt("You: #{player_wins} -- Computer: #{computer_wins} -- Ties: #{ties}")

  next unless player_wins == 5 || computer_wins == 5
  display_winner(player_wins, computer_wins)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  player_wins = 0
  computer_wins = 0
  ties = 0
end

prompt("Thank you for playing. Good bye!")
