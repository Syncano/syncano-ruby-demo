class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @auctions = []
  end

  def new

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