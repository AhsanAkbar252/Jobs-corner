class AddAttachmentAttachmentToJobApplications < ActiveRecord::Migration[6.0]
  def self.up
    change_table :job_applications do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :job_applications, :attachment
  end
end
