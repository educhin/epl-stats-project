class Team

  attr_accessor :name
  attr_reader :players

  @@all = []

  def initialize(name)
      @name = name
      @players = []
      @@all << self
  end

  def self.all_teams
    @@all
  end

  def players_list
    Player.all_players.select {|player| player.team.name == self.name}
  end

  def self.find_team(name)
    all_teams.detect{|team| team.name == name}
  end

  def self.find_or_create_by_name(name)
    # team = self.find_team(name)
    #
    # if team == nil
    #   team = Team.new(name)
    #   team
    # else
    #   team
    # end

    find_team(name) || Team.new(name)
  end

  def self.display_teams
    teams = self.all_teams.sort_by(&:name)
    teams.each do |team|
      puts "#{team.name}"
    end
  end

  def display_team_players
    players = self.players_list.sort{ |a, b|  b.goals <=> a.goals }
    puts "#{self.name} Top Scorers"
    players.each_with_index do |player, i|
      puts "#{i + 1}) #{player.name} #{player.goals} goals"
      puts "------------------"
    end
  end
end
