require_relative 'scraper.rb'

class Player

  attr_accessor :name, :team, :goals

  @@all = []

  def initialize(name, team, goals)
      @name = name
      @team = team
      @goals = goals

      @@all << self
  end

  def self.all
    @all
  end

  def self.display_players
    @@all.each do |player|
      puts "Name: #{player.name} Team: #{player.team} Goals: #{player.goals}"
    end
  end
end