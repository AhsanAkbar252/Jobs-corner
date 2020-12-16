class Job < ApplicationRecord
has_attached_file :avatar, styles: {large: "800x500", medium: "500x300"}
belongs_to :user,foreign_key: :user_id
has_many :job_applications
validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
 before_save {self.employer_email = employer_email.downcase}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :employer_email, presence: true,length: {maximum: 90}, format: {with: VALID_EMAIL_REGEX }
validates :title,presence: true,length: {minimum:5,maximum:20}
validates :salary,presence: true,:numericality => { :greater_than_or_equal_to => 0 }
validates :qualification,presence: true,length: {maximum:40}
validates :experience,presence: true, :numericality => { :greater_than_or_equal_to => 0 }
validates :job_address,presence: true,length: {maximum:40}
validates :job_city,presence: true,length: {maximum:20}
validates :job_country,presence: true,length: {maximum:200}
validates :description,presence: true,length: {minimum:5,maximum:200}
validates :package_detail,presence: true,length: {minimum:5,maximum:200}
validates :employer_detail,presence: true,length: {minimum:5,maximum:200}
validates :job_requirements,presence: true,length: {minimum:5,maximum:200}
end
