class WarehousesController < ApplicationController
  authorize_resource

  expose :warehouses, -> { Warehouse.order(created_at: :desc) }
  expose :warehouse

  def create
    if warehouse.save
      redirect_to warehouses_path, notice: 'Warehouse has been added successfully.'
    else
      render :new
    end
  end

  def update
    if warehouse.update(warehouse_params)
      redirect_to warehouses_path, notice: 'Warehouse has been modified successfully'
    else
      render :edit
    end
  end

  def destroy
    if warehouse.destroy
      redirect_to warehouses_path, notice: 'Warehouse has been deleted successfully.'
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :description)
  end
end
