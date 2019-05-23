class Player
  
  attr_accessor :name, :team, :goals
  
  def initialize(name, team, goals)
      @name = name
      @team = team
      @goals = goals
  end
end 