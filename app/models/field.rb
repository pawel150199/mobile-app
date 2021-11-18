class Field < ApplicationRecord
    has_many :questions
    validates :name, presence: true, length: { in: 5..50 }
end
