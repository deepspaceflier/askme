class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname
 
  validates :email, presence: true, uniqueness: true, 
            format: { with: /\A.+@.+\z/i}
            
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, 
            format: { with: /\A[a-z_]+\z/ }
  
  private

  def downcase_nickname
    nickname.downcase!
  end
end
