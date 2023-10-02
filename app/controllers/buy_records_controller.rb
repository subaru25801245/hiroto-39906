class BuyRecordsController < ApplicationController
  include PaymentModule

  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_own_item_or_sold_out, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_record_form = BuyRecordForm.new
  end

  def create
    @buy_record_form = BuyRecordForm.new(buy_record_params)
    if @buy_record_form.valid?
      pay_item(@item, buy_record_params[:token])
      @buy_record_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      Rails.logger.debug @buy_record_form.errors.full_messages
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_own_item_or_sold_out
    if @item.user_id == current_user.id  || @item.buy_record.present?
      redirect_to root_path
    end

  def buy_record_params
    params.require(:buy_record_form).permit(:token, :post_code, :prefecture_id, :area, :address, :build_name, :tel).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  end
end
