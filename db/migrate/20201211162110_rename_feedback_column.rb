class RenameFeedbackColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :feedbacks, :password, :message
  end
end
