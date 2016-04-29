class CreaturesController < ApplicationController
  before_filter :set_creature, except: [:index,:create,:new]
  def index
    @creature = Creature.all
  end
  def new
    @creature = Creature.new
  end
  def create
    @creature = Creature.create(creature_params)
    redirect_to creatures_path
  end
  def show
  end
  def edit
  end
  def update
    @creature.update(creature_params)
    redirect_to creature_path(@creature)
  end
  def destroy
    @creature.destroy
    redirect_to creatures_path
  end

  private
  def creature_params
    params.require(:creature).permit(:name,:description)
  end
  def set_creature
    @creature  = Creature.find(params[:id])
  end
end
