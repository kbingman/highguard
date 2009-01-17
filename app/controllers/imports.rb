class Imports < Application
  # provides :xml, :yaml, :js

  def index
    @imports = Import.all
    display @imports
  end

  def show(id)
    @import = Import.get(id)
    raise NotFound unless @import
    display @import
  end

  def new
    only_provides :html
    @import = Import.new
    display @import
  end

  def edit(id)
    only_provides :html
    @import = Import.get(id)
    raise NotFound unless @import
    display @import
  end

  def create(import)
    @import = Import.new(import)
    if @import.save
      redirect resource(@import), :message => {:notice => "Import was successfully created"}
    else
      message[:error] = "Import failed to be created"
      render :new
    end
  end

  def update(id, import)
    @import = Import.get(id)
    raise NotFound unless @import
    if @import.update_attributes(import)
       redirect resource(@import)
    else
      display @import, :edit
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

end # Imports
