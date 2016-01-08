class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @previous = Item.where("id < ?", params[:id]).order(:id).last   
    @next = Item.where("id > ?", params[:id]).order(:id).first
  end
end
