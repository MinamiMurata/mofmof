class Access < ApplicationRecord
  belongs_to :property, inverse_of: :accesses
end
