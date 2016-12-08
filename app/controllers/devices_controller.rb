class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  def index
    @devices = Device.order(:tag)
  end

  # GET /devices/1
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /devices/1
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /devices/1
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :tag, :dev_type, :make, :model, :serial, :purchased_on, :warranty_length, :warranty_type, :person_id)
    end
end
