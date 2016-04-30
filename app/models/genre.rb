class Genre < ActiveRecord::Base
  has_and_belongs_to_many :items, -> { uniq }
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  normalize_attribute :name, with: [ :squish, :blank ] do |value|
    value.is_a?(String) ? value.capitalize : value
  end
end
