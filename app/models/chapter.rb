class Chapter < ApplicationRecord
  belongs_to :book

  validates :title, presence: true
end
