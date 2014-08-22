class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.boolean :admin, default: false
      t.boolean :teacher, default: false
      t.integer :group_id

      t.timestamps
    end
  end
end
