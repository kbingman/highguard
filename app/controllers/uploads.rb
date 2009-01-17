class Uploads < Application

  def index
    @uploads = Upload.all
    @uploads.each do |upload|
      upload.thumbnail('thumb','80x80')
    end
    display @uploads
  end
  
  def new
    render
  end
  
  def show(id)
    @upload = Upload.get(id)
    raise NotFound unless @upload
    @upload.thumbnail('display','640x640')
    display @upload
  end
  
  def create
    @upload = Upload.new 
    @upload.content_type = params[:file][:content_type]
    
    tempfile_path = params[:file][:tempfile].path
    filename = File.basename(params[:file][:filename]) 
    
    if @upload.process(tempfile_path,filename)
      redirect url(:upload, @upload)
    else
      message[:error] = "Error uploading"
      render :new
    end
  end
  
end
