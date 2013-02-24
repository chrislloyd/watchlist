class FilmsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_filter :authenticate_user!
  
  # GET /films
  # GET /films.json
  def index
    # @films = Film.find(:all, :order => 'id ASC', :user => current_user )
    @films = current_user.films( :order => 'id ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @films }
    end
  end

  def watched
    @films = Film.where(:status => [true]).find(:all, :order => "id ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @films }
    end
  end

  # GET /films/1
  # GET /films/1.json
  def show
    @film = Film.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film }
    end
  end

  def sort
    new_order = params[:films]
    films = current_user.films(:all)
    update_order(new_order, films)
    render :text => nil
  end

  def update_order(new_order, films_to_update)
    if films_to_update !=nil && new_order !=nil && films_to_update.count == new_order.count
      films_to_update.each do |film|
        film.position = new_order.index(film.id.to_s) + 1
        film.save
      end
    end
  end

  # GET /films/new
  # GET /films/new.json
  def new
    @film = Film.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @film }
    end
  end

  # GET /films/1/edit
  def edit
    @film = Film.find(params[:id])
  end

  # POST /films
  # POST /films.json
  def create
    @film = current_user.films.new(params[:film])
    @film.save

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render json: @film, status: :created, location: @film }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @film.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /films/1
  # PUT /films/1.json
  def update
    @film = Film.find(params[:id])

    respond_to do |format|
      if @film.update_attributes(params[:film])
        format.html { redirect_to films_url, notice: 'Film was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end


  def watch_toggle
    @status = Film.find(params[:id])
    @status.toggle!(:status)

    respond_to do |format|
      flash[:success] = "Yeah"
      format.html { redirect_to root_path }
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film = Film.find(params[:id])
    @film.destroy

    respond_to do |format|
      format.html { redirect_to films_url }
      format.json { head :no_content }
    end
  end
end
