# frozen_string_literal: true

class WrestlingEvent < ApplicationRecord
  validates :title, presence: true
end
