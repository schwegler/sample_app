# frozen_string_literal: true

class TvShow < ApplicationRecord
  validates :title, presence: true
end
