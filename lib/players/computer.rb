require 'pry'
module Players
    class Computer < Player
        def move(board)
            if win_or_block(board) != nil
                win_or_block(board)
            elsif board.cells == Array.new(9, " ")
                "1"
            elsif !board.taken?("5")
                "5"
            else
                if board.cells[0] == board.cells[8] && board.cells[8] != " " || board.cells[2] == board.cells[6] && board.cells[6] != " "
                    if !board.taken?("2") || !board.taken?("4") || !board.taken?("6") || !board.taken?("8")
                        ["2", "4", "6", "8"].sample
                    else
                        ["1", "3", "7", "9"].sample
                    end
                else
                    if !board.taken?("1") || !board.taken?("3") || !board.taken?("7") || !board.taken?("9")
                        ["1", "3", "7", "9"].sample
                    else
                        ["2", "4", "6", "8"].sample
                    end
                end
            end
        end
            
        def win_or_block(board)
            b = board.cells
            move = nil
            Game::WIN_COMBINATIONS.each do |one, two, three|
                if b[one] == b[two] && b[two] != " " && b[three] == " "
                    move = "#{three + 1}"
                elsif b[two] == b[three] && b[three] != " " && b[one] == " " 
                    move = "#{one + 1}"
                elsif b[one] == b[three] && b[three] != " " && b[two] == " " 
                    move = "#{two + 1}"
                end
            end
            move
        end
    end
end