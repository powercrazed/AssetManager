class LicencesController < ApplicationController
  before_action :set_licence, only: [:show, :edit, :update, :destroy]

  # GET /licences
  def index
    @licences = Licence.order(:vendor)
  end

  # GET /licences/1
  def show
  end

  # GET /licences/new
  def new
    @licence = Licence.new
  end

  # GET /licences/1/edit
  def edit
  end

  # POST /licences
  def create
    @licence = Licence.new(licence_params)

    respond_to do |format|
      if @licence.save
        format.html { redirect_to @licence, notice: 'Licence was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /licences/1
  def update
    respond_to do |format|
      if @licence.update(licence_params)
        format.html { redirect_to @licence, notice: 'Licence was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /licences/1
  def destroy
    @licence.destroy
    respond_to do |format|
      format.html { redirect_to licences_url, notice: 'Licence was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_licence
      @licence = Licence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def licence_params
      params.require(:licence).permit(:vendor, :app_name, :version, :edition, :channel, :purchased_from, :purchased_on, :device_id, :person_id, :in_use)
    end
end
