class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.string :eventtype
      t.date :eventdate

      t.timestamps
    end
  end
end
