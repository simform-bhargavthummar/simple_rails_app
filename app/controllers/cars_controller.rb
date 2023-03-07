class CarsController < ApplicationController
  before_action :require_login
  before_action :get_id, only: [:show, :destroy, :edit, :update]
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "You added car"
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @car.update(car_params)
      redirect_to cars_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def show
    car = Car.find(params[:id])
    pdf = Prawn::Document.new 
    pdf.text "Car Name  : #{car.name}", align: :center, size: 30
    pdf.text "Car Color : #{car.color}", align: :center, size: 25
    pdf.text "Car Price : #{car.price}", align: :center, size: 25
    
    send_data(pdf.render,
      filename: 'demo',
      type: 'application/pdf')
  end

  def search  
    @cars = Car.all
    get_car_param = params[:name] 
    if get_car_param == ""
      @cars = Car.all
    else
      @cars = Car.where(name: get_car_param)
    end
  end

  def download_pdf
    car = Car.find(params[:id])
  end
  
  private 
    def car_params
      params.require(:car).permit(:name, :color, :price, :average)
    end

    def get_id
      @car = Car.find(params[:id])
    end


end
