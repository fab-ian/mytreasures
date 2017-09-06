class TreasuresController < ApplicationController
  authorize_resource

  expose(
    :treasures,
    -> { Treasure.filtered_records(params[:q]).order(created_at: :desc).page params[:page] }
  )
  expose :treasure

  def create
    treasure.user_id = current_user.id

    if treasure.save
      redirect_to(
        new_treasure_path,
        notice: I18n.t('treasure_notice.add')
      )
    else
      render :new
    end
  end

  def update
    if treasure.update(treasure_params)
      redirect_to treasure_path(treasure), notice: I18n.t('treasure_notice.update')
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
    params.require(:treasure).permit(:name, :description, :warehouse_id, :photo)
  end
end
