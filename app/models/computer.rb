class Computer
  include DataMapper::Resource
  
  property :id, Serial
  property :model, String
  property :tonnage, Integer
  property :capacity, String
  property :tech_level, Integer
  
  property :created_at,     DateTime
  property :updated_at,     DateTime
  
  has n, :ships
end
