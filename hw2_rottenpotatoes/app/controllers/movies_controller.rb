class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # If a sort/filter key is in session, but not params, add it to the URL by redirecting
    if (!params.has_key?(:sort) && session.has_key?(:sort))
      redirect_to movies_path( params.merge(:sort => session[:sort]) )
    elsif (!params.has_key?(:ratings) && session.has_key?(:ratings))
      redirect_to movies_path( params.merge(:ratings => session[:ratings]) )
    end

    # Get params from URL and store them in session, overwriting previous values
    params.keys.each do |key|
      session[key] = params[key]
    end

    @all_ratings = Movie.ratings

    @sort_type = session[:sort]
    # Set classes to hilite the headers in the view
    if @sort_type == "title"
      @title_class = "hilite"
    elsif @sort_type == "release_date"
      @release_date_class = "hilite"
    end

    @selected_ratings = session[:ratings] ? session[:ratings].keys : @all_ratings #keys if ratings exists, else give all

    @movies = Movie.where(rating: @selected_ratings).order(@sort_type)

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def handleSession
    #session[:a]
  end

end
