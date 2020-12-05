class AddAvatar < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :avatar_file_name , :string
    add_column :job_applications, :avatar_content_type,:string
    add_column :job_applications, :avatar_file_size,:integer
    add_column :job_applications, :avatar_updated_at,:datetime
  end
end
