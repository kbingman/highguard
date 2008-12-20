class Turrets < Application
  # provides :xml, :yaml, :js

  def index
    @turrets = Turret.all
    display @turrets
  end

  def show(id)
    @turret = Turret.get(id)
    raise NotFound unless @turret
    display @turret
  end

  def new
    only_provides :html
    @turret = Turret.new
    display @turret
  end

  def edit(id)
    only_provides :html
    @turret = Turret.get(id)
    raise NotFound unless @turret
    display @turret
  end

  def create(turret)
    @turret = Turret.new(turret)
    if @turret.save
      redirect resource(@turret), :message => {:notice => "Turret was successfully created"}
    else
      message[:error] = "Turret failed to be created"
      render :new
    end
  end

  def update(id, turret)
    @turret = Turret.get(id)
    raise NotFound unless @turret
    if @turret.update_attributes(turret)
       redirect resource(@turret)
    else
      display @turret, :edit
    end
  end

  def destroy(id)
    @turret = Turret.get(id)
    raise NotFound unless @turret
    if @turret.destroy
      redirect resource(:turrets)
    else
      raise InternalServerError
    end
  end

end # Turrets
