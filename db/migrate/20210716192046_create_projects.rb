class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :github_url
      t.string :demo_vid
      t.string :site_url
      t.string :blog_url

      t.timestamps
    end
  end
end
