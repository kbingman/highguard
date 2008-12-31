class Armor
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :tech_level, Integer
  property :protection, Integer
  property :cost, Integer
  property :max, Integer
  
  has n, :ships

end
