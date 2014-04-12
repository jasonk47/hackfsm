class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name
      t.string :description
      t.date :date
      t.float :value

      t.references :group
      t.timestamps
    end
  end
end
