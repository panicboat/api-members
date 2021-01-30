class Medium < ApplicationRecord
  belongs_to :member

  enum status: { available: 1, unavailable: 2 }
end
