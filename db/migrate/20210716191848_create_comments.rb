class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :email
      t.text :content
      t.integer :project_id

      t.timestamps
    end
  end
end
