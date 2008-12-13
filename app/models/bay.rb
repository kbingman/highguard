class Bay
  include DataMapper::Resource
  
  property :id, Serial
  property :size, Integer
  property :number, Integer
  
  property :created_at,     DateTime
  property :updated_at,     DateTime
  
  belongs_to :weapon
  belongs_to :ship

end
