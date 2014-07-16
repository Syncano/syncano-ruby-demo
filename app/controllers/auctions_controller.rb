class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :get_auction, only: [:edit, :update, :destroy]

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(params[:auction])
    @auction.user_id = current_user.id

    if @auction.save
      redirect_to(root_path, success: 'Auction has been created!')
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    @auction.attributes = params[:auction]

    if @auction.save
      redirect_to(root_path, success: 'Auction has been saved!')
    else
      render(:edit)
    end
  end

  def destroy
    if @auction.destroy
      redirect_to(root_path, success: 'Auction has been destroyed!')
    else
      redirect_to(root_path, error: 'Something went wrong and auction has not been destroyed!')
    end
  end

  private

  def get_auction
    @auction = Auction.find(params[:id])
    raise(RecordNotFound) unless @auction.belongs_to_user?(current_user)
  end
end