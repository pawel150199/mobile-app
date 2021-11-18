class User < ApplicationRecord
    has_many :statistics
    validates :username, presence: true, uniqueness: true , length: { in: 3..20 }
    validates :last_score, presence: true, length: {in: 0..100}
    has_secure_password
    has_secure_token
    validates :password, presence: true, length: {minimum: 6}
    def invalidate_token
        self.update_columns(token: nil)
    end
end
