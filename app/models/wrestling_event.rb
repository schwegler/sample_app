class WrestlingEvent < ApplicationRecord
  validates :title, presence: true

  has_one_attached :cover_art
  has_many :collection_items, as: :media_item, dependent: :destroy
end
