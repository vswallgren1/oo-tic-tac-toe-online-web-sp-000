class TicTacToe

  attr_accessor :token, :board, :player

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
  @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count {|space| space == "X" || space == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    index = input_to_index(gets.chomp)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?


      WIN_COMBINATIONS.find { |win_combo|
        index_0 = win_combo[0]
        index_1 = win_combo[1]
        index_2 = win_combo[2]
        position_1 = @board[index_0]
        position_2 = @board[index_1]
        position_3 = @board[index_2]
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combo
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
          end
        }
        return false
  end

  def full?
    turn_count >= 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @board[win_combo[0]]
    end
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else puts "Congratulations #{winner}!"
    end
  end

end
