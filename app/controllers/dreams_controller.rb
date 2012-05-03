class DreamsController < ApplicationController
  def index
    @dreams = Dream.all
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(params[:dream])

    if @dream.save
      redirect_to dream_path(@dream)
    else
      render :new
    end
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])

    if @dream.update_attributes(params[:dream])
      redirect_to dream_path(@dream)
    else
      render :edit
    end
  end
end
