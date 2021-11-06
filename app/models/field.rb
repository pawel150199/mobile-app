class Field < ApplicationRecord
    has_many :questions
    validates :name, presence: true, length: { in: 50..200 }
end
