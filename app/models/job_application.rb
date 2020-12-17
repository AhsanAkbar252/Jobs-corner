class JobApplication < ApplicationRecord
  has_attached_file :avatar, styles: {large: "800x500", medium: "500x300"}
  #   styles: { large: ["855x570>", :jpg], medium: ["432x288>", :jpg], small: ["276x184>", :jpg], tiny: => ["195x130>", :jpg] },
  # processor: "mini_magick",
  # convert_options: {
  #   medium: "-background white -compose Copy -gravity center -extent 432x288",
  #   small: "-background white -compose Copy -gravity center -extent 276x184",
  #   tiny: "-background white -compose Copy -gravity center -extent 195x130"
  # }

  belongs_to :user
  belongs_to :job
  has_attached_file :file

  validates_attachment :file,presence: true, :content_type => {:content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
   before_save {self.applicant_email = applicant_email.downcase}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :applicant_email, presence: true, length: {maximum: 90}, format: {with: VALID_EMAIL_REGEX }
validates :name,presence: true,length: {minimum:5,maximum:20}
validates :age,presence: true,:numericality => { :greater_than_or_equal_to => 0 }
validates :qualification,presence: true,length: {maximum:20}
validates :qualification_detail,presence: true,length: {maximum:200}
validates :experience,presence: true, :numericality => { :greater_than_or_equal_to => 0 }
validates :experience_detail,presence: true,length: {maximum:200}
validates :address,presence: true,length: {maximum:100}
validates :city,presence: true,length: {maximum:20}
validates :country,presence: true,length: {maximum:20}
validates :previous_company,presence: true,length: {minimum:5,maximum:30}
validates :personalinfo,presence: true,length: {minimum:5,maximum:200}
validates :skills,presence: true,length: {minimum:5,maximum:200}


end