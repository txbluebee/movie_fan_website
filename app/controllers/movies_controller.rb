class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @random_movies = Movie.order('RANDOM()').limit(5)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie successfully added!"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.reviews.each do |review|
      review.destroy
    end
    @movie.destroy
    redirect_to movies_path
  end



  private
    def movie_params
      params.require(:movie).permit(:name, :actors, :genre, :image)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end
end
