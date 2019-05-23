class Team
  
  attr_accessor :name, :team, :goals
  
  @@all = []
  
  def initialize(name)
      @name = name
      @@all << self
  end
  
  self.all def
    @@all
  end
end 