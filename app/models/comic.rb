# frozen_string_literal: true

class Comic < ApplicationRecord
  validates :title, presence: true
end
