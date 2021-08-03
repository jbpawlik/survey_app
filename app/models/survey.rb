class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
end