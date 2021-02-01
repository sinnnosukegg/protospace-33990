class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototypes_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototypes_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def prototypes_params
    params.require(:prototype).permit(:content, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  end

end
