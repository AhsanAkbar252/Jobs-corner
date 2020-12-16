class Feedback < ApplicationRecord
  validates :username,presence: true,length: {maximum:20}
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,length: {maximum: 90}, format: {with: VALID_EMAIL_REGEX }
  validates :message,presence: true,length: {minimum:5, maximum:40}



end