class MoviesController < ApplicationController
  
  before_action :check_for_cancel, :only => [:create, :update]
  before_action :check_for_login, :only => [:search_tmdb, :all_destroy, :new, :edit, :destroy]

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to movie_path
    end
  end
  def check_for_login
    unless set_current_user
      flash[:warning] = "Please log in before do this action"
      redirect_to movies_path
    end
  end

  def index
    @movies = Movie.all
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    render(:partial => 'movie', :object => @movie) if request.xhr?
    # will render app/views/movies/show.html.haml by default
  end
  def new
    #@movie = Movie.new
    @movie = Movie.new
    # default: render 'new' template
  end 
  def create
    user_params = params.require(:movie).permit(:title,:rating,:release_date,:description)
    @movie = Movie.create!(user_params)
    flash[:notice] = "#{@movie.title} was successfully created." 
    redirect_to movie_path(@movie)
  end
  def edit
    @movie = Movie.find params[:id]
  end
  def update
    @movie = Movie.find params[:id]
    permitted = params[:movie].permit(:title,:rating,:release_date,:description)
    @movie.update_attributes!(permitted)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def createall_from_movies(search_movie)
      search_movie.each do |movie|
        if Movie.exists?(:title => movie.title,:description => movie.overview) == false
          permitted = {:title => movie.title,:release_date =>movie.release_date,:description => movie.overview}
          Movie.create!(permitted)
        end
      end
    end  

    def search_tmdb
      #@search_params = params[:search_terms]
      #@search_params = " " if @search_params  == ""
      #@search = Tmdb::Movie.find(@search_params)
      #createall_from_movies(@search)
      #if @search != []
      #  render "search"
      #else
      #  flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
      #  redirect_to movies_path
      #end
      @search_params = params[:search_terms]
      @search_params = " " if @search_params  == ""
      @search = Tmdb::Movie.find(@search_params)
      createall_from_movies(@search)
      if @search != []
        render "search"
      else
        flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb."
        redirect_to movies_path
      end
    end

    def all_destroy
      Movie.destroy_all
      flash[:notice] = "All Movie deleted."
      redirect_to movies_path
    end
end