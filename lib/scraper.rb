require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative 'player.rb'

class Scraper
    def get_page
       doc = Nokogiri::HTML(open("https://sports.ndtv.com/english-premier-league/stats/top-goal-scorers-player-statsdetail"))
    end

    def get_players
        players = self.get_page.css("tr")
        #the first entry in this array is irrelavant and should be removed.
        players.shift
    end

    def make_players
      players = []
      self.get_players.each do |player|
          player_name = player.css(".tblplayername").text
          player_team = player.css(".tblteam").text
          player_goals = player.css(".tblgoals").text
          new_player = Player.new(player_name, player_team, player_goals)
          players << new_player
        end

      players
    end
end

scraper = Scraper.new
scraper.make_players