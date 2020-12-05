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
end