class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :course
      t.string :faculty

      t.timestamps
    end
  end
end
