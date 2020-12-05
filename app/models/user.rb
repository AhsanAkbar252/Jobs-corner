class User <ApplicationRecord
  has_one :profile
  has_many :jobs, foreign_key: :user_id
  has_many :applications

  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end