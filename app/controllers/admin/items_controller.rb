module Admin
  class ItemsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Item.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Item.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information
    
    def update
      @item = Item.find(params[:id])
      
      if @item.update_attributes(item_params)
        flash[:notice] = "Item successfully updated"
        redirect_to admin_item_path(@item)
      else
        render 'edit'
      end
    end
    
    def create
      @item = Item.new(item_params)
      
      if @item.save
        flash[:notice] = "Item saved"
        redirect_to admin_items_path
      else
        render 'new'
      end
    end
    
  private
    def item_params
      params.require(:item).permit(:title,
                                   :alt_title,
                                   :info,
                                   :episodes,
                                   :discs,
                                   :details,
                                   { genre_ids: [] },
                                   { language_ids: [] },
                                   :front,
                                   :back)
    end
  end
end
