require "administrate/field/base"

class DragonflyField < Administrate::Field::Base
  def image_url()
    return 'no_cover.jpg' if data.nil?
    Dragonfly.app.fetch(data).thumb('400x566#').url
  end
end
