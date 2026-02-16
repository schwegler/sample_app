class Comic < ApplicationRecord
  validates :title, presence: true
end
