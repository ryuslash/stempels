class StampsController < ApplicationController
  def index
    if params[:brand].present?
      @stamps = Stamp.branded(params[:brand])
    else
      @stamps = Stamp.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @stamps }
    end
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
