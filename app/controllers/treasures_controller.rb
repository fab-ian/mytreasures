class TreasuresController < ApplicationController
  expose :treasures, -> { Treasure.filtered_records(params[:q]).order(created_at: :desc).page params[:page] }
  expose :treasure

  def create
    if treasure.save
      redirect_to new_treasure_path, notice: 'The treasure has been saved successfully! Add next one.'
    else
      render :new
    end
  end

  def update
    if treasure.update(treasure_params)
      redirect_to treasure_path(treasure), notice: 'The treasure has been updated successfully.'
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
