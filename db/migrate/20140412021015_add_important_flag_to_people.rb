class AddImportantFlagToPeople < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.boolean :important
    end
  end
end
