class AddAvatarToJob < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :avatar_file_name , :string
    add_column :jobs, :avatar_content_type,:string
    add_column :jobs, :avatar_file_size,:integer
    add_column :jobs, :avatar_updated_at,:datetime
  end
end
