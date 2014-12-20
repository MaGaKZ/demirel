class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :content
      t.integer :subject_id
      t.integer :user_id

      t.timestamps
    end
  end
end
