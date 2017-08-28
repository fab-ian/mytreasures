class WarehousesController < ApplicationController
  authorize_resource

  expose :warehouses, -> { Warehouse.order(created_at: :desc) }
  expose :warehouse

  def create
    if warehouse.save
      redirect_to warehouses_path, notice: I18n.t('warehouse_notice.add')
    else
      render :new
    end
  end

  def update
    if warehouse.update(warehouse_params)
      redirect_to warehouses_path, notice: I18n.t('warehouse_notice.update')
    else
      render :edit
    end
  end

  def destroy
    if warehouse.destroy
      redirect_to warehouses_path, notice: I18n.t('warehouse_notice.remove')
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :description)
  end
end
