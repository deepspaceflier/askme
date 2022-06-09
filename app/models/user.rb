class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname
 
  validates :email, presence: true, uniqueness: true, 
            format: { with: /[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+/i }
            
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, 
            format: { with: /\A[a-z_]+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
