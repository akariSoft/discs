class Genre < ActiveRecord::Base
  has_and_belongs_to_many :items, -> { uniq }
  
  normalize_attribute :name, with: [ :squish, :blank ]
end
