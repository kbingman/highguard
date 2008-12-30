class Bay
  include DataMapper::Resource
  
  property :id, Serial
  property :size, Integer
  property :number, Integer
  
  belongs_to :weapon
  belongs_to :ship
  
  def name
    self.weapon.name
  end
  
  def tonnage
    self.number * self.size
  end
  
  private
    def check_availability 
      # available_bays = self.ship.available_bays
      # if (self.number + available_bays) > available_bays
      #   self.number = available_bays
      # else
      #   self.number = self.number
      # end
      # self.number = number > self.ship.available_bays ? self.ship.available_bays : number
    end
    
    def check_weapons
      if number >= 0
        return true
      else
        [false, "You have reached your limit of available bays."]
      end
    end

end
