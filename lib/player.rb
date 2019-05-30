class Player

  attr_accessor :name, :team, :goals

  @@all = []

  def initialize(name, team, goals)
      @name = name
      @team = team
      @goals = goals

      @@all << self
      @team.players << self
  end

  def self.all_players
    @@all
  end

  def self.display_players
    self.all_players.each do |player|
      puts "Name: #{player.name}"
      puts "Team: #{player.team.name}"
      puts "Goals: #{player.goals}"
      puts "--------------------------"
    end
  end
end
