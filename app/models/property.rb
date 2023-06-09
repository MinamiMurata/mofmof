class Property < ApplicationRecord
  has_many :accesses, dependent: :destroy
  accepts_nested_attributes_for :accesses, allow_destroy: true
end
