class ItemsController < ApplicationController
  before_filter :verify_user_agent
  def index
    @item_groups = Item.all.in_groups_of(3, false)
  end

  def show
    @item = Item.find(params[:id])
    @previous = Item.where("id < ?", params[:id]).order(:id).last   
    @next = Item.where("id > ?", params[:id]).order(:id).first
  end
  
private
  def verify_user_agent
    redirect_to admin_root_path unless browser.ua.downcase.include? 'electron'
  end
end
