class Team

  attr_accessor :name, :team, :goals

  @@all = []

  def initialize(name)
      @name = name
      @@all << self
  end

  def self.all
    @@all
  end

  def players
    Player.all.select do |player|
      player.team.name == self.name
    end
  end
end