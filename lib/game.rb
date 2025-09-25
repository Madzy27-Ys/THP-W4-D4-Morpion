class Game
  WIN_COMBOS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize
    puts "Nom du joueur 1 :".colorize(:red)
    name1 = gets.chomp
    puts "Nom du joueur 2 :".colorize(:blue)
    name2 = gets.chomp

    @players = [Player.new(name1, "X"), Player.new(name2, "O")]
    @current_player = @players.first
    @board = Array.new(9, " ")
  end

  def play
    loop do
      display_board
      puts "#{@current_player.name} (#{@current_player.symbol}), choisis une case (1-9) :"
      move = gets.chomp.to_i - 1

      if valid_move?(move)
        @board[move] = @current_player.symbol
        if winner?
          display_board
          puts "#{@current_player.name} a gagné !".colorize(:green).bold
          update_score(@current_player, loser)
          break
        elsif @board.none? { |c| c == " " }
          display_board
          puts "Match nul !".colorize(:yellow).bold
          @players.each { |p| p.draws += 1 }
          break
        else
          switch_player
        end
      else
        puts "Coup invalide, réessaie."
      end
    end

    show_score
  end

  private

  def valid_move?(index)
    index.between?(0,8) && @board[index] == " "
  end

  def winner?
    WIN_COMBOS.any? do |combo|
      symbols = combo.map { |i| @board[i] }
      symbols.all?("X") || symbols.all?("O")
    end
  end

  def loser
    @players.find { |p| p != @current_player }
  end

  def switch_player
    @current_player = @players.find { |p| p != @current_player }
  end

  def display_board
    puts ""
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "--+---+--"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "--+---+--"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts ""
  end

  def update_score(winner, loser)
    winner.wins += 1
    loser.losses += 1
  end

  def show_score
    puts "\nScore :".colorize(:magenta)
    @players.each do |p|
      puts "#{p.name} - Victoires: #{p.wins}, Défaites: #{p.losses}, Nuls: #{p.draws}".colorize(:magenta)
    end
  end
end


game = Game.new
game.play
