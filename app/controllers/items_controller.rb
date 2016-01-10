class ItemsController < ApplicationController
  def index
    @item_groups = Item.all.in_groups_of(3, false)
  end

  def show
    @item = Item.find(params[:id])
    @previous = Item.where("id < ?", params[:id]).order(:id).last   
    @next = Item.where("id > ?", params[:id]).order(:id).first
  end
end
