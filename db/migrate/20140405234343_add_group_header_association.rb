class AddGroupHeaderAssociation < ActiveRecord::Migration
  def change
    change_table :groups do |t|
      t.references :group_header
    end
  end
end
