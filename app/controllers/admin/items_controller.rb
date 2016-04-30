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
    
  private
    def resource_params
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
