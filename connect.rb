#create a method in the board class called add_piece the add piece method should take the object piece as an input and fill in one of the array spots on the board with an x, if there is already an x there it will fill in an x at the spot above

class Board
	def initialize 
		@board = [
			["-", "-", "-", "-"],
			["-", "-", "-", "-"],
			["-", "-", "-", "-"],
			["-", "-", "-", "-"],
		]
	end

	def print_board
		@board.each do |row|
			puts row.join(" ")
		end
	end

	def add_player1_piece(piece)
		row = 3
		until row == -1 
			if @board[row][piece.column] == "-"
					@board[row][piece.column].replace("X")
				row = -1
			else
				row = row -1
			end
		end
	end

	def add_player2_piece(piece)
		row = 3
		until row == -1 
			if @board[row][piece.column] == "-"
					@board[row][piece.column].replace("O")
				row = -1
			else
				row = row -1
			end
		end
	end
end

class Piece
	def initialize(user_input_column_number)
		@column = user_input_column_number
	end

	def column
		return @column
	end
end

puts "do you want to play connect?"
user_input = gets.chomp.upcase
if user_input == "YES"
	board = Board.new
end

game_turns = 0

until game_turns == 16
	if game_turns.even?
		puts "player 1 select a column: 1, 2, 3, or 4"
		user_input = gets.chomp.to_i - 1
		piece = Piece.new(user_input)
		board.add_player1_piece(piece)
		board.print_board
		game_turns = game_turns + 1
	else
		puts "player 2 select a column: 1, 2, 3, or 4"
		user_input = gets.chomp.to_i - 1
		piece = Piece.new(user_input)
		board.add_player2_piece(piece)
		board.print_board
		game_turns = game_turns + 1
	end
end