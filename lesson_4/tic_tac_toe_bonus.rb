require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # lines
                [[1, 5, 9], [3, 5, 7]].freeze       # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
FIRST_PLAYER = 'choose'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are '#{PLAYER_MARKER}'   Computer is '#{COMPUTER_MARKER}'"
  puts "First to 5 rounds wins"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(ary, connect = ',', word = 'or')
  ary[-1] = "#{word} #{ary.last}" if ary.size > 1
  ary.size == 2 ? ary.join(' ') : ary.join(connect)
end

def pick_square!(brd, current_player)
  if current_player == 'player'
    player_picks_square!(brd)
  else
    computer_picks_square!(brd)
  end
end

def alternate_player(player)
  if player == 'player'
    'computer'
  else
    'player'
  end
end

def player_picks_square!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry that is not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
def computer_picks_square!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = 5 if empty_squares(brd).include?(5)
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity

def display_score(player, computer)
  prompt "Score - You = #{player} Computer #{computer}"
end

def tie?(brd)
  empty_squares(brd) == []
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_wins = 0
computer_wins = 0

loop do
  if FIRST_PLAYER == 'choose'
    player = ''
    loop do
      prompt "Please pick who will start? ('p' for player or 'c' for computer)"
      player = gets.chomp.downcase
      if player == 'p'
        player = 'player'
      elsif player == 'c'
        player == 'computer'
      end
      break if player.start_with?('p', 'c')
      prompt "That is not a valid choice."
    end
  end

  loop do
    board = initialize_board
    loop do
      display_board(board)
      display_score(player_wins, computer_wins)
      pick_square!(board, player)
      player = alternate_player(player)
      break if winner?(board) || tie?(board)
    end

    display_board(board)

    if winner?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == 'Player'
        player_wins += 1
      else
        computer_wins += 1
      end
    else
      prompt "It's a tie!"
    end

    if player_wins == 5
      prompt "YOU ARE THE WINNER!!"
      break
    elsif computer_wins == 5
      prompt "The computer won!"
      break
    end
    sleep(1)
  end

  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe!"
