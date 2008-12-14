require 'prawn'

class Ship
  include DataMapper::Resource

  property :id,             Serial # primary serial key
  property :name,           String
  property :description,    Text
  property :ship_type,      String
  property :tonnage,        Integer
  property :tech_level,     Integer
  property :staterooms,     Integer
  property :jumpdrive,      Integer
  property :thrust,         Integer
  property :power,          Integer
  property :price,          Integer
  
  property :created_at,     DateTime
  property :updated_at,     DateTime
  
  belongs_to :configuration
  # belongs_to :computer
  
  has n, :bays
  has n, :turrets
  has n, :barbettes
  
  validates_present :name
  
  def max_jumpdrive
    max_jump = tech_level - 9
    max = max_jump > 0 ? max_jump : 0
    max = tech_level == 9 ? 1 : max
    max
  end
  
  def jump_tonnage
    jumpdrive ? (jumpdrive + 1) * 0.01 * tonnage : 0
  end
  
  def jump_fuel
    jumpdrive ? jumpdrive * 0.1 * tonnage : 0
  end
  
  def jump_price
    jumpdrive ? 4 * jump_tonnage : 0
  end
  
  def max_thrust
    case 
      when tech_level == 7 : max = 2
      when tech_level == 8 : max = 5
      when tech_level > 8  : max = 6
    end
    max
  end
  
  def thrust_tonnage
    thrust ? ((thrust * 3)-1) * 0.01 * tonnage : 0
  end
  
  def thrust_price
    case
      when thrust == 1 : modifier = 1.5
      when thrust == 2 : modifier = 0.7
      when thrust >  2 : modifier = 0.5
    end
    modifier ? modifier * thrust_tonnage : 0
  end
  
  def powerplant_tonnage
    case 
      when tech_level == 7 || tech_level == 8 : percentage = 0.04
      when tech_level >= 9 && tech_level <= 12  : percentage = 0.03
      when tech_level >= 13 && tech_level <= 14 : percentage = 0.02
      when tech_level == 15 : percentage = 0.01
    end
    power ? (power * percentage * tonnage) : 0
  end
  
  def powerplant_price
    power ? 4 * powerplant_tonnage : 0
  end
  
  def powerplant_fuel
    power ? power * 0.01 * tonnage : 0
  end
  
  def fuel
    powerplant_fuel + jump_fuel
  end
  
  def stateroom_tonnage
    staterooms ? staterooms * 4 : 0
  end
  
  def bridge
    bridge = tonnage * 0.02
    (bridge > 20) ? bridge : 20
  end
  
  def ep
    power ? (0.01 * tonnage * power) : 0
  end
  
  def hull_price
    tonnage * self.configuration.modifier * 0.1
  end
  
  def hardpoints
    tonnage / 100
  end
  
  def available_bays
    tonnage / 1000
  end
  
  def bay_tonnage
    bay_tonnage = 0
    self.bays.each do |bay|
      bay_tonnage = bay_tonnage + (bay.number * bay.size.to_i)
    end
    bay_tonnage
  end
  
  def available_turrets
    tonnage / 100
  end
  
  def turret_tonnage
    turret_tonnage = 0
    self.turrets.each do |turret|
      turret_tonnage = turret_tonnage + (turret.number * turret.size.to_i)
    end
    turret_tonnage
  end
  
  def subtotal_tonnage
    bridge + 
    stateroom_tonnage +
    powerplant_tonnage + 
    thrust_tonnage + 
    jump_tonnage + 
    jump_fuel +
    bay_tonnage +
    turret_tonnage
  end
  
  def to_pdf
    document = Prawn::Document.new do |p| 
      p.text 'Document Name', :align => 'center' 
      p.text 'Address: address' 
      p.text 'text end' 
    end.render 
    send_data document, :type => 'application/pdf'
  end
  
  

end
