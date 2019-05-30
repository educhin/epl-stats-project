require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './team.rb'
require_relative './player.rb'


class Scraper
  def get_page
     doc = Nokogiri::HTML(open("https://sports.ndtv.com/english-premier-league/stats/top-goal-scorers-player-statsdetail"))
  end

  def get_players
    players = self.get_page.css("tr")
    #the first entry in this array is irrelavant and should be removed.
    players.shift
    players
  end

  def make_players
    players = []
    self.get_players.each do |player|
      # css("si-table-td")
      player_name = player.css(".tblplayername").text.strip
      player_team = Team.find_or_create_by_name(player.css(".tblteam").text.strip)
      player_goals = player.css(".tblgoals").text.strip

      new_player = Player.new(player_name, player_team, player_goals)
      players << new_player
    end
    players
  end
end
