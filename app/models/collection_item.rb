class CollectionItem < ApplicationRecord
  belongs_to :collection
  belongs_to :media_item, polymorphic: true
end
