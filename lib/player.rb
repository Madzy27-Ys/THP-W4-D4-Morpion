class Player
  attr_accessor :name, :symbol, :wins, :losses, :draws

  def initialize(name, symbol)
    @name = name
    @symbol = symbol.colorize(:cyan)
    @wins = 0
    @losses = 0
    @draws = 0
  end
end