class Member < ApplicationRecord
  has_many :media, dependent: :destroy
end
