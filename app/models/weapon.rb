class Weapon
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :min_tech_level, Integer
  
  property :turret, Boolean
  property :bay, Boolean
  property :barbette, Boolean
  
  property :created_at,     DateTime
  property :updated_at,     DateTime

  has n, :bays
  has n, :turrets
  has n, :barbettes
  
end
