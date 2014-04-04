class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :resolution
      t.string :source_url
      t.string :source_name
      t.string :source_author

      t.timestamps
    end
  end
end
