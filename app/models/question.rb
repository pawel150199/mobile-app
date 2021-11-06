class Question < ApplicationRecord
  belongs_to :field
  has_many :answers
  has_many :statistics
end
