class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.date :date
      t.text :summary
      t.string :source_url

      t.timestamps
    end
  end
end
