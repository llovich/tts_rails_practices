class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
  end

  def index
    @dogs = Dog.all
    @order_dogs = Dog.order(:name)
  end

  def new
    @dog = Dog.new
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      flash[:notice] = "Dog updated!"
      redirect_to dog_url(@dog)
    else
      flash.now[:alert] = "Could not update dog :("
      render :edit
    end
  end

  def destroy
    @dog = Dog.find(params[:id])

    if @dog.destroy
      redirect_to dogs_url, notice: "Successfully deleted!"
    else
      redirect_to dogs_url, notice: "Could not delete dog."
    end
  end

  def create
   @dog = Dog.new(dog_params)
   if @dog.save
     redirect_to dogs_url, notice: "Dog saved!"
      else
      flash.now[:notice] = "Could not save dog. :("
      render :new
    end
  end

  private
    #important - white listed params - set only the ones you want to save
    #also security/blocks users from injecting nefarious data into db
    def dog_params
    params.require(:dog).permit(:name, :breed_id, :age, :owner_id)
  end
end

