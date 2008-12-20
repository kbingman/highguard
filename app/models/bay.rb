class Bay
  include DataMapper::Resource
  before :create, :check_availability
  
  property :id, Serial
  property :size, Integer
  property :number, Integer
  
  property :created_at, DateTime
  property :updated_at, DateTime
  
  belongs_to :weapon
  belongs_to :ship
  
  def name
    self.weapon.name
  end
  
  private
    def check_availability
      self.number = number > self.ship.available_bays ? self.ship.available_bays : number
    end

end
