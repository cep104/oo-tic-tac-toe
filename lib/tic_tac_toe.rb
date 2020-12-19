class TicTacToe
    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def display_board
            puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
            puts "-----------"
            puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
            puts "-----------"
            puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input_int = input.to_i 
        index = input_int - 1
    end

    def move(board_num, token="X")
        @board[board_num] = token
    end

    def position_taken?(board_num)
        if @board[board_num] == " "
            false
        else
            true
        end
    end 

    def valid_move?(board_num)
        if board_num > 8 || board_num < 0
            false
        elsif position_taken?(board_num) == true
            false
        else
            true
        end
    end

    def turn_count
        turn = 0
        @board.each do |index|
            if index != " "
                turn += 1
            else
                turn
            end
        end
        turn
    end 

    def current_player
        turn_num = turn_count
        if turn_num % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        user_move = gets.chomp.to_i
        translated_move = input_to_index(user_move)
        if valid_move?(translated_move)
            move(translated_move)
            current_player
            display_board
        else
            puts "invalid"
            turn
        end
    end

    def won?
        if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
            WIN_COMBINATIONS[0]
        elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
            WIN_COMBINATIONS[1]
        elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
            WIN_COMBINATIONS[2]
        elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
            WIN_COMBINATIONS[3]
        elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
            WIN_COMBINATIONS[4]
        elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
            WIN_COMBINATIONS[5]
        elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
            WIN_COMBINATIONS[6]
        elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
            WIN_COMBINATIONS[7]
        elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
                WIN_COMBINATIONS[0]
        elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
                WIN_COMBINATIONS[1]
        elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
                WIN_COMBINATIONS[2]
        elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
                WIN_COMBINATIONS[3]
        elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
                WIN_COMBINATIONS[4]
        elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
                WIN_COMBINATIONS[5]
        elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
                WIN_COMBINATIONS[6]
        elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "0"
                WIN_COMBINATIONS[7]
        else
            false
        end
    end

    def full?
        empty_count = 0
        @board.each do |place|
            if place == " "
                empty_count += 1
            else
                empty_count
            end
        end

        if empty_count == 0
            true
        else
            false
        end
    end

    def draw?
        if self.full? == true && self.won? == false
            true
        else
            false
        end
    end

    def over?
        if self.draw? == true
            true
        elsif self.won?.class == Array
            true
        else
            false
        end
    end

    def winner
        if self.won?.class == Array
            x_count = 0
            o_count = 0
            @board.each do |token|
                if token == "X"
                    x_count += 1
                elsif token == "O"
                    o_count += 1
                end
            end
            if x_count > o_count
                "X"
            else
                "O"
            end
        else
            nil
        end

        
    end

    def play 
        until self.over? == true do 
            self.turn
            self.over?
        end
    
        if self.won?.class == Array
            winner = self.winner
            puts "Congratulations #{winner}!"
        elsif self.draw? == true
            puts "Cat's Game!"
        end

    end
         


end