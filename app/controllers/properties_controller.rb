class PropertiesController < ApplicationController
  def index
    @propertise = Property.all
  end

  def new
    @property = Property.new
    @property.accesses.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new
    end
  end

  def confirm
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, accesses_attributes: %i[line station time])
  end
end
