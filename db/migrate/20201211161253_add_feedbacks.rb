class AddFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :username
      t.string :email
      t.string :password
    end
  end
end
