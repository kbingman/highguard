class Barbette
  include DataMapper::Resource
  # before :save, :check_availability
  # 
  # validates_with_method :check_weapons
  
  property :id, Serial
  property :size, String
  property :number, Integer
  
  belongs_to :weapon
  belongs_to :ship
  
  def name
    self.weapon.name
  end
  
  def tonnage
    self.number * 5
  end
  
  private
    def check_availability
      self.number = number > self.ship.available_hardpoints ? self.ship.available_hardpoints : number
    end
  
    def check_weapons
      if number >= 0
        return true
      else
        [false, "You have reached your limit of available bays."]
      end
    end

end
