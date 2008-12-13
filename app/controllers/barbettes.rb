class Barbettes < Application
  # provides :xml, :yaml, :js

  def index
    @barbettes = Barbette.all
    display @barbettes
  end

  def show(id)
    @barbette = Barbette.get(id)
    raise NotFound unless @barbette
    display @barbette
  end

  def new
    only_provides :html
    @barbette = Barbette.new
    display @barbette
  end

  def edit(id)
    only_provides :html
    @barbette = Barbette.get(id)
    raise NotFound unless @barbette
    display @barbette
  end

  def create(barbette)
    @barbette = Barbette.new(barbette)
    if @barbette.save
      redirect resource(@barbette), :message => {:notice => "Barbette was successfully created"}
    else
      message[:error] = "Barbette failed to be created"
      render :new
    end
  end

  def update(id, barbette)
    @barbette = Barbette.get(id)
    raise NotFound unless @barbette
    if @barbette.update_attributes(barbette)
       redirect resource(@barbette)
    else
      display @barbette, :edit
    end
  end

  def destroy(id)
    @barbette = Barbette.get(id)
    raise NotFound unless @barbette
    if @barbette.destroy
      redirect resource(:barbettes)
    else
      raise InternalServerError
    end
  end

end # Barbettes
