class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :get_auction, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @active_category = Category.find(params[:category_id]) if params[:category_id].present?

    if @active_category.present?
      @auctions = @active_category.auctions.all
    else
      @auctions = Auction.all
    end
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
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
    @auction.attributes = auction_params

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

  def auction_params
    params.require(:auction).permit(:category_id, :title, :text, :price)
  end

  def get_auction
    @auction = Auction.by_user_id(current_user.id).find(params[:id])
    raise(RecordNotFound) unless @auction.belongs_to_user?(current_user)
  end
end