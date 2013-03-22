class TvsController < ApplicationController
  # GET /tvs
  # GET /tvs.json
  def index
    @tvs = Tv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tvs }
    end
  end

  # GET /tvs/1
  # GET /tvs/1.json
  def show
    @tv = Tv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tv }
    end
  end

  # GET /tvs/new
  # GET /tvs/new.json
  def new
    @tv = Tv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tv }
    end
  end

  # GET /tvs/1/edit
  def edit
    @tv = Tv.find(params[:id])
  end

  # POST /tvs
  # POST /tvs.json
  def create
    @tv = Tv.new(params[:tv])

    respond_to do |format|
      if @tv.save
        format.html { redirect_to @tv, notice: 'Tv was successfully created.' }
        format.json { render json: @tv, status: :created, location: @tv }
      else
        format.html { render action: "new" }
        format.json { render json: @tv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tvs/1
  # PUT /tvs/1.json
  def update
    @tv = Tv.find(params[:id])

    respond_to do |format|
      if @tv.update_attributes(params[:tv])
        format.html { redirect_to @tv, notice: 'Tv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvs/1
  # DELETE /tvs/1.json
  def destroy
    @tv = Tv.find(params[:id])
    @tv.destroy

    respond_to do |format|
      format.html { redirect_to tvs_url }
      format.json { head :no_content }
    end
  end
end
