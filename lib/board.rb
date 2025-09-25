class Board

    attr_accessor :array_cases

    def initialize
        @A1 = BoardCase.new("a1", " ")
        @B1 = BoardCase.new("b1", " ")
        @C1 = BoardCase.new("c1", " ")
        @A2 = BoardCase.new("a2", " ")
        @B2 = BoardCase.new("b2", " ")
        @C2 = BoardCase.new("c2", " ")
        @A3 = BoardCase.new("a3", " ")
        @B3 = BoardCase.new("b3", " ")
        @C3 = BoardCase.new("c3", " ")

        @array_cases = [@A1,@B1,@C1,@A2,@B2,@C2,@A3,@B3,@C3]
    end

    def valid_move?(position)
        @array_cases.each do |boardcase|
            if boardcase.position == position
                return boardcase.content == " "
            end
        end
        return false
    end

    def valid_move(position, symbol)
        case_to_play = @array_cases.find { |boardcase| boardcase.position == position}

        if case_to_play && case_to_play.content == " "
            case_to_play.content = symbol
            true
        else 
            false
        end
    end

    def winner?
        winning_combo = [
            ["a1","a2","a3"],
            ["b1","b2","b3"],
            ["c1","c2","c3"],
            ["a1","a2","a3"],
            ["a2","b2","c2"],
            ["a3","b3","c3"],
            ["a1","b2","c3"],
            ["a3","b2","c1"],
        ]

        winning_combo.each do |combo|
            c1 = @array_cases.find { |c| c.position == combo[0] }.content
            c2 = @array_cases.find { |c| c.position == combo[1] }.content
            c3 = @array_cases.find { |c| c.position == combo[2] }.content

            return c1 if c1 == c2 && c2 == c3 && c1 != " "
        end
        return nil
    end
    
end