class Weapon
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :tech_level, Integer
  
  property :turret, Boolean
  property :barbette, Boolean
  property :bay, Boolean
  
  property :turret_price, Float
  property :barbette_price, Float
  property :bay_price_100, Float
  property :bay_price_50, Float
  
  has n, :bays
  has n, :turrets
  has n, :barbettes
  
end
