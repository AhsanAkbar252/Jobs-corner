class RenameFileColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_applications, :attachment_file_name, :file_file_name
    rename_column :job_applications, :attachment_content_type, :file_content_type
    rename_column :job_applications, :attachment_file_size, :file_file_size
    rename_column :job_applications, :attachment_updated_at, :file_updated_at

  end
end
