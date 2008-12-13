class Weapons < Application
  # provides :xml, :yaml, :js

  def index
    @weapons = Weapon.all
    display @weapons
  end

  def show(id)
    @weapon = Weapon.get(id)
    raise NotFound unless @weapon
    display @weapon
  end

  def new
    only_provides :html
    @weapon = Weapon.new
    display @weapon
  end

  def edit(id)
    only_provides :html
    @weapon = Weapon.get(id)
    raise NotFound unless @weapon
    display @weapon
  end

  def create(weapon)
    @weapon = Weapon.new(weapon)
    if @weapon.save
      redirect resource(@weapon), :message => {:notice => "Weapon was successfully created"}
    else
      message[:error] = "Weapon failed to be created"
      render :new
    end
  end

  def update(id, weapon)
    @weapon = Weapon.get(id)
    raise NotFound unless @weapon
    if @weapon.update_attributes(weapon)
       redirect resource(@weapon)
    else
      display @weapon, :edit
    end
  end

  def destroy(id)
    @weapon = Weapon.get(id)
    raise NotFound unless @weapon
    if @weapon.destroy
      redirect resource(:weapons)
    else
      raise InternalServerError
    end
  end

end # Weapons
