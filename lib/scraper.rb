require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative 'player.rb'

class Scraper
    def get_page
       doc = Nokogiri::HTML(open("https://sports.ndtv.com/english-premier-league/stats/top-goal-scorers-player-statsdetail"))
    end

    def get_players
        self.get_page.css("tr")
    end

    def make_players
        self.get_players.each do |player|
          player = player.css("si-table-td")
            player_name = player.css(".tblplayername").text
            player_team = player.css(".tblteam").text
            player_goals = player.css(".tblgoals")
            new_player = Player.new(player_name, player_club, player_goals)
        end   
    end   
end

Scraper.new.get_page