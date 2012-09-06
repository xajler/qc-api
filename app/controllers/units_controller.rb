class UnitsController < ApplicationController
  include ActionController::MimeResponds

  respond_to :json

  def index
    @units = Unit.includes(:parent).all
    respond_with(@units)
  end

  def show
    @unit = Unit.find(params[:id])
    @unit.set_units_lookup
  end

  def create
    #binding.pry
    @unit = Unit.new(params[:unit])

    if @unit.save
      @unit.set_units_lookup
      respond_with(@unit)
    else
      render json: { errors: @unit.errors.full_messages }, status: 422
    end
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.update_attributes(params[:unit])
      @unit.set_units_lookup
      respond_with(@unit)
    else
      render json: { errors: @unit.errors.full_messages }, status: 422
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    if @unit.destroyed?
      render json: '', status: 204
    else
      render json: { errors: @unit.errors.full_messages }, status: 422
    end
  end
end
