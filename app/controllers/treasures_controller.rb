class TreasuresController < ApplicationController
  expose :treasures, -> { Treasure.includes(:warehouse, :status).order(created_at: :desc) }
  expose :treasure

  def create
    if treasure.save
      redirect_to new_treasure_path, notice: 'The photo has been saved successfully!'
    else
      render :new
    end
  end

  def update
    if treasure.update(treasure_params)
      redirect_to treasures_path
    else
      render :edit
    end
  end

  def destroy
    treasure.destroy
    redirect_to treasures_path
  end

  private

  def treasure_params
    params.require(:treasure).permit(:name, :description, :warehouse_id, :status_id, :photo)
  end
end
