class EplStats
  def initialize
    Scraper.new.make_players
    print_menu
  end

  def print_menu
    puts "Welcome to the EPL goal stats app"
    puts "To view a list of teams type: Show all teams"
    puts "To view a list of all top scorers type: Show all players"
    puts "To view a list of top scorers from a team type the team's name full name"
    puts "To exit type: Exit"
    puts "To see these instructions again type: Help"
  end


  def run_prgrm
    puts "--------------------------"
    puts "What would you like to do?"
    input = gets.strip
    adjusted_input = input.split.map(&:capitalize).join(' ')
    team = Team.find_team(adjusted_input)

    if team != nil
      team.display_team_players
      self.run_prgrm
    else
      case adjusted_input
      when "Show All Players"
        Player.display_players
        self.run_prgrm
      when "Show All Teams"
        Team.display_teams
        self.run_prgrm
      when "Exit"
        exit
      when "Help"
        self.print_menu
        self.run_prgrm
      else
        puts "Our apologies, your request was not understood. Please try again"
        self.run_prgrm
      end
    end
  end
end
