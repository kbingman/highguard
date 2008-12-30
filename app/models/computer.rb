class Computer
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :jump_minimum, Integer
  property :rating, Integer
  property :tech_level, Integer
  property :price, Integer
    
  has n, :ships
      
end
