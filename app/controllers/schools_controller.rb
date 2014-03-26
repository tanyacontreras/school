class SchoolsController < ApplicationController

  def index
    @schools = School.where(zip: params[:zip])
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
    full_address = "#{@school.address}, #{@school.city}, #{@school.state}, #{@school.zip}"
    latlng = Geocoder.coordinates(full_address)
    @school.latitude  = latlng[0]
    @school.longitude = latlng[1]

    respond_to do |format|
      if @school.save
        flash[:notice] = "The school was successfully created."
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school }
      else
        flash[:error] = "The school was unsuccessfully created."
        format.html { render action: 'new' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      full_address = "#{@school.address}, #{@school.city}, #{@school.state}, #{@school.zip}"
      latlng = Geocoder.coordinates(full_address)
      @school.latitude  = latlng[0]
      @school.longitude = latlng[1]

      respond_to do |format|
      if @school.save
        flash[:notice] = "The school was successfully updated."
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @school }
      else
        flash[:notice] = "The school was not updated."
        format.html { render action: 'edit' }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  def destroy
    @school = School.find(params[:id])
    if @school.destroy
      flash[:notice] = "The school was successfully deleted."
      redirect_to @school
    else 
      flash[:error] = "The school was not deleted."
      redirect_to @school
    end
  end

  private
  def school_params
    params.require(:school).permit(:name, :address, :city, :zip, :county, :state, :phone_number, :url, :grade_level, :rating, :is_religious, :school_type, :enrollment)
  end

end
