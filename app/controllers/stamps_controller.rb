class StampsController < ApplicationController
  def index
    @stamps = Stamp.all
  end

  def new
  end

  def create
  end
end
