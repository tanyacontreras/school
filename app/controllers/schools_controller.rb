class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def edit
    @school = School.find(params[:id])
  end

  def create
    @school = School.new(school_params)
    address_feed = school.address + " " + school.city + " " + school.state + " " + school.zip
    latlng = Geocoder.coordinates(address_feed)
    school.latitude  = latlng[0]
    school.longitude = latlng[1]
    # school.save
    # binding.pry
    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school }
      else
        format.html { render action: 'new' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end

  private

    def school_params
      params.require(:school).permit(:name, :address, :city, :zip, :county, :phone_number, :url, :grade_level, :rating, :is_religious, :school_type, :latitude, :longitude)
    end
end
