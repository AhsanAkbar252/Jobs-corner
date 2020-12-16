class Profile < ApplicationRecord
has_attached_file :avatar, styles: {large: "800x500", medium: "500x300"}
belongs_to :user 
validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
 before_save {self.user_email = user_email.downcase}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :user_email, presence: true, length: {maximum: 90}, format: {with: VALID_EMAIL_REGEX }
validates :name,presence: true,length: {minimum:5,maximum:20}
validates :personal_info,presence: true,length: {maximum:300}
validates :qualification,presence: true,length: {maximum:40}
validates :profession,presence: true,length: {maximum:40}
validates :experience,presence: true, :numericality => { :greater_than_or_equal_to => 0 }
validates :address,presence: true,length: {maximum:40}
validates :city,presence: true,length: {maximum:20}
validates :country,presence: true,length: {maximum:20}
validates :experience_detail,presence: true,length: {minimum:5,maximum:200}
validates :working_at,presence: true,length: {minimum:5,maximum:200}
validates :skills,presence: true,length: {maximum:20}
validates :interests,presence: true,length: {minimum:5,maximum:200}
end