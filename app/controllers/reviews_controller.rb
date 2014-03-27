class ReviewsController < ApplicationController
  
  def index
    @review = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @school = School.find(params[:school_id])
  end

  def new
    @review = Review.new
    @school = School.find(params[:school_id])
  end

  def create
    school = School.find(params[:school_id])
    review = school.reviews.new(review_params)
    if review.save
      flash[:notice] = "Your school review was successfully created."
      redirect_to school_review_path(:school_id => school.id, :id => review.id)
    else
      flash[:error] = "Your school review was not created."
      render action: 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @school = School.find(params[:school_id])
  end

  def update
    @school = School.find(params[:school_id])
    @review = @school.reviews.find(params[:id])
      if @review.update(review_params)
        redirect_to school_path(:id => @review.school_id), notice: 'Your post was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "Your review was successfully deleted."
      redirect_to school_path(:id => @review.school_id)
    else 
      flash[:error] = "Your review was unsuccessfully deleted."
      redirect_to @review
    end
  end

  private
  def review_params
      params.require(:review).permit(:text, :rating)
  end
end
