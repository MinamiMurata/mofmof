class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @propertise = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.accesses.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "物件を登録しました！"
    else
      render :new
    end
  end

  def show
    @accesses = @property.accesses
  end

  def edit
    @property.accesses.build
  end

  def update
    @property.accesses.destroy if @property.accesses.empty?
    if @property.update(property_params)
      Access.where("line=='' OR station=='' OR time == ''").each { |a| a.destroy }
      redirect_to properties_path, notice: "物件情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件情報を削除しました！"
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, accesses_attributes: %i[id line station time])
  end
end
