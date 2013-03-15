class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :task

      t.timestamps
    end
    add_index :comments, :task_id
  end
end
