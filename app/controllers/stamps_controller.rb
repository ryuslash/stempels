class StampsController < ApplicationController
  def index
    @stamps = Stamp.all
  end

  def new
    @stamp = Stamp.new
  end

  def create
    @stamp = Stamp.new(params[:stamp])

    if @stamp.save
      flash[:success] = t('stamps.created')
      redirect_to root_path
    else
      render 'new'
    end
  end
end
