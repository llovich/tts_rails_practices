class BogsController < ApplicationController
  def index
     @blogs = Bog.all
  end

  def new
    @blog = Bog.new
  end

  def edit
    @blog = Bog.find(params[:id])
  end

  def show
    @blog = Bog.find(params[:id])
  end

  def update
    @blog = Bog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to bogs_url(@blog), notice: "Dog updated!"
    else
      flash.now[:notice] = "Could not update dog :("
      render :edit
    end
  end

   def destroy
    @blog = Bog.find(params[:id])

    if @blog.destroy
      redirect_to bogs_url, notice: "Successfully deleted!"
    else
      redirect_to bogs_url, notice: "Could not delete dog."
    end
  end

  def create
   @blog = Bog.new(blog_params)
   if @blog.save
     redirect_to bogs_url, notice: "Blog saved!"
      else
      flash.now[:notice] = "Could not save Blog. :("
      render :new
    end
  end

  private
    #important - white listed params - set only the ones you want to save
    #also security/blocks users from injecting nefarious data into db
    def blog_params
    params.require(:bog).permit(:title, :content, :author)
  end

end #ends class
