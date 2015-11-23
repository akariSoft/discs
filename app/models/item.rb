class Item < ActiveRecord::Base
  has_and_belongs_to_many :genres, -> { uniq }
  has_and_belongs_to_many :languages, -> { uniq }

  dragonfly_accessor :front
  dragonfly_accessor :back
end
