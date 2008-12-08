class Computers < Application
  # provides :xml, :yaml, :js

  def index
    @computers = Computer.all
    display @computers
  end

  def show(id)
    @computer = Computer.get(id)
    raise NotFound unless @computer
    display @computer
  end

  def new
    only_provides :html
    @computer = Computer.new
    display @computer
  end

  def edit(id)
    only_provides :html
    @computer = Computer.get(id)
    raise NotFound unless @computer
    display @computer
  end

  def create(computer)
    @computer = Computer.new(computer)
    if @computer.save
      redirect resource(@computer), :message => {:notice => "Computer was successfully created"}
    else
      message[:error] = "Computer failed to be created"
      render :new
    end
  end

  def update(id, computer)
    @computer = Computer.get(id)
    raise NotFound unless @computer
    if @computer.update_attributes(computer)
       redirect resource(@computer)
    else
      display @computer, :edit
    end
  end

  def destroy(id)
    @computer = Computer.get(id)
    raise NotFound unless @computer
    if @computer.destroy
      redirect resource(:computers)
    else
      raise InternalServerError
    end
  end

end # Computers
