class Job < ApplicationRecord
has_attached_file :avatar, styles: {large: "800x500", medium: "500x300"}
belongs_to :user,foreign_key: :user_id
has_many :job_applications
validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end