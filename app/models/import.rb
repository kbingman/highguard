class Import
  include DataMapper::Resource
  
  property :id, Serial  
  property :path, String  
  # property :size, Integer
  property :total_size, Integer
  
  def size
    Dir[File.join(self.path, '*')].find_all{|file| file if File.file?(file)}.size  
  end
  
  def percentage        
    # (size.to_f / total_size.to_f * 100).to_i  
    percentage = total_size == 0 ? 0 : (total_size.to_f - size.to_f) / total_size.to_f * 100
    sprintf("%2.0f", percentage)
  end

end
