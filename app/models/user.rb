class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
 
  validates :password, length: { minimum: 6 }
  belongs_to :group
  has_many :marks
  has_attached_file :avatar
  validates_attachment_presence :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_secure_password
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end

