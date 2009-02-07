class Imports < Application
  # provides :xml, :yaml, :js
  DIR = File.join Merb.root, 'public', 'import' 

  def index
    @imports = Import.all
    display @imports
  end

  def show(id)
    @import = Import.get(id) 
    raise NotFound unless @import
    @size = @import.size 
    display @import
  end

  def new
    only_provides :html
    @import = Import.new 
    @paths = Dir[File.join(DIR, '*')].find_all{|file| file if File.directory?(file)}     
    display @import
  end

  def edit(id)
    only_provides :html
    @import = Import.get(id) 
    raise NotFound unless @import
    @size = @import.size   
    display @import
  end

  def create(import)
    @import = Import.new(import)    
    
    # dir = File.join Merb.root, 'public', 'import'
        
    path = params[:import][:path] 
    @import.path = path    
    @import.total_size = Dir[File.join(path, '*')].find_all{|file| file if File.file?(file)}.size.to_i
    @import.imported = 0
    if @import.save     
      redirect url(:import, @import) # , :message => {:notice => "#{@import.size} files were successfully imported."} 
    else
      render :new, :message => {:notice => "Import failed to be created" }
    end
  end

  def update(id, import)    
    provides :html, :js
    @import = Import.get(id)   
    @title = 'Upload Progress'
    raise NotFound unless @import  
      
    files = Dir[File.join(@import.path, '*')].find_all{|file| file if File.file?(file)}   
    @size = @import.size     
    
    if @size > 0
      file = files.first  
      upload = Upload.new
      filename = File.basename(file)
      if upload.process(file,filename)     
        @size -= 1
        @import.imported += 1     
      else  
        display @import, :show
      end 
      if @import.save
         case content_type 
         when :js        
           @import.destroy if @size == 0 
           display @import
         else  
           redirect resource(@import)       
         end
      else
        display @import, :show
      end 
    else     
      @import.destroy
      redirect url(:uploads), :message => {:notice => "Files successfully imported." }
    end
    
  end

  def destroy(id)
    @import = Import.get(id)
    raise NotFound unless @import
    if @import.destroy
      redirect resource(:imports)
    else
      raise InternalServerError
    end
  end

end 
