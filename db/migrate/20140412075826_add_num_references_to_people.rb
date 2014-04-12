class AddNumReferencesToPeople < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :count
    end
  end
end
