class ReviewsController < ApplicationController
  
  def index
  end

  def show
  end

  def new
    @review = Review.new
    @school = School.find(params[:school_id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
