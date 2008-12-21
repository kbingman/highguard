require 'prawn'

class Ship
  include DataMapper::Resource
  
  before :save, :check_drives

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
  
  def bay_tonnage
    bay_tonnage = 0
    self.bays.each do |bay|
      bay_tonnage = bay_tonnage + (bay.number * bay.size.to_i)
    end
    bay_tonnage
  end
  
  def total_bays
    total_bays = 0
    self.bays.each do |bay|
      total_bays = total_bays + bay.number
    end
    total_bays
  end
  
  def available_bays
    case 
      when tonnage >= 1000 : available_bays = (tonnage / 1000) - total_bays
      when tonnage < 1000  : available_bays = 1 - total_bays
    end
    available_bays
  end
  
  def turret_tonnage
    turret_tonnage = 0
    self.turrets.each do |turret|
      turret_tonnage = turret_tonnage + (turret.number * turret.size.to_i)
    end
    turret_tonnage
  end
  
  def total_turrets
    total_turrets = 0
    self.turrets.each do |turret|
      total_turrets = total_turrets + turret.number
    end
    total_turrets
  end
  
  def barbette_tonnage
    barbette_tonnage = 0
    self.barbettes.each do |barbette|
      barbette_tonnage = barbette_tonnage + (barbette.number * barbette.size.to_i)
    end
    barbette_tonnage
  end
  
  def total_barbettes
    total_barbettes = 0
    self.barbettes.each do |barbette|
      total_barbettes = total_barbettes + barbette.number
    end
    total_barbettes
  end
  
  def available_hardpoints
    (tonnage / 100) - total_barbettes - total_turrets
  end
  
  def to_pdf_
    Prawn::Document.new do   
      bounding_box [100,600], :width => 200 do
        text "The rain in spain falls mainly on the plains " * 5
        stroke do
          line bounds.top_left,    bounds.top_right
          line bounds.bottom_left, bounds.bottom_right
        end
      end

      bounding_box [100,500], :width => 200, :height => 200 do
        stroke do
          circle_at [100,100], :radius => 100
          line bounds.top_left, bounds.bottom_right
          line bounds.top_right, bounds.bottom_left
        end   

        bounding_box [50,150], :width => 100, :height => 100 do
          stroke_rectangle bounds.top_left, bounds.width, bounds.height
        end   
      end
    end.render
    send_file pdf, :filename => "#{self.name}.pdf", :type => "application/pdf"
  end
  
  def subtotal_tonnage
    bridge + 
    stateroom_tonnage +
    powerplant_tonnage + 
    thrust_tonnage + 
    jump_tonnage + 
    jump_fuel +
    bay_tonnage +
    barbette_tonnage +
    turret_tonnage
  end
  
  private
   def check_drives
     if jumpdrive
       self.jumpdrive = jumpdrive > max_jumpdrive ? max_jumpdrive : jumpdrive
     end
     if jumpdrive && thrust
       required_power = thrust > jumpdrive ? thrust : jumpdrive
       self.power = required_power unless power > required_power
     end
     end

end
