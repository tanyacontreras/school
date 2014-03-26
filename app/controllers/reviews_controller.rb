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
  end

  def update
  end

  def destroy
  end

  private
  def review_params
      params.require(:review).permit(:text)
  end
end
