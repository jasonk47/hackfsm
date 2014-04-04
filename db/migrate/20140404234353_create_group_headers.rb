class CreateGroupHeaders < ActiveRecord::Migration
  def change
    create_table :group_headers do |t|
      t.string :name

      t.timestamps
    end
  end
end
