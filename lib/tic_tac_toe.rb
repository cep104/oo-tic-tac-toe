require 'pry'

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
        if board_num.between?(0, 8) && self.position_taken?(board_num) == false
            true
        else
            false
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
        # binding.pry
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

    # def turn
    #     user_move = gets.chomp.to_i
    #     translated_move = input_to_index(user_move)
    #     if valid_move?(translated_move)
    #         move(translated_move, current_player)
    #         display_board
    #     else
    #         puts "invalid"
    #         turn
    #     end
    # end
    def turn 
        
        choice = gets.chomp.to_i
        
        position = input_to_index(choice)
        if valid_move?(position)
            #player_token = current_player
            move(position, current_player)
            display_board
        else
            turn
        end
       
    end 

    def won?
        WIN_COMBINATIONS.any? do |win_combo|
            if self.position_taken?(win_combo[0]) == true && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
                return win_combo
            end
        end
    end

    def full?
        @board.all? do |place|
            place != " "
        end
    end

    def draw?
        if self.full? == true && self.won? == false
            true
        end
    end

    def over?
        won? || draw?
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

    # def play 
    #     self.turn until self.over? == true
    
    #     if self.won?.class == Array
    #         winner = self.winner
    #         puts "Congratulations #{winner}!"
    #     elsif self.draw? == true
    #         puts "Cat's Game!"
    #     end

    # end
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end


end