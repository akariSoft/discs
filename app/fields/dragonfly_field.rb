require "administrate/fields/base"

class DragonflyField < Administrate::Field::Base
  def image_url
    Dragonfly.app.fetch(data).thumb('400x566#').url
  end
end
