class Property < ApplicationRecord
  has_many :accesses, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :accesses, allow_destroy: true, reject_if: :all_blank
  validates :name, :rent, :address, :age, presence: true
end
