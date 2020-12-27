class User <ApplicationRecord
  has_one :profile
  has_many :jobs, foreign_key: :user_id
  has_many :job_applications
  validates :username, presence: true, uniqueness: {case_sensitive: false} , length: {minimum: 3, maximum: 15}
  validates :email, presence: true, uniqueness: {case_sensitive: false} , length: {minimum: 3, maximum: 30}

  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end