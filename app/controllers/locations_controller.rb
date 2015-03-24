class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def import
    Location.import(params[:file])
    redirect_to root_path, notice: "Imported successfully"
  end

  def index
    @locations = Location.all
    respond_to do |format|
      format.html
      format.gpx do
        name_and_download_GPX
        LocationSweeper.new.clear_database_after_download
      end
    end
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html {
          redirect_to @location,
          notice: 'Location was successfully created.'
        }
        format.json {
          render :show,
          status: :created, location: @location
        }
      else
        format.html { render :new }
        format.json {
          render json: @location.errors,
          status: :unprocessable_entity
        }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html {
          redirect_to @location,
          notice: 'Location was successfully updated.'
        }
        format.json {
          render :show,
          status: :ok,
          location: @location
        }
      else
        format.html { render :edit }
        format.json {
          render json: @location.errors,
          status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @location.destroy

    respond_to do |format|
      format.html {
        redirect_to locations_url,
        notice: 'Location was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.
        require(:location).
        permit(:address, :latitude, :longitude)
    end

    def name_and_download_GPX
      file_name = "GeoCodedLocations" + Date.today.to_s + ".gpx"
      response.headers['Content-Disposition'] = 'attachment; filename=' + file_name
      render "index.gpx.erb"
    end
end
