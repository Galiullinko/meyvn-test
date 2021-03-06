class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.string :topics, array: true, default: []

      t.timestamps
    end
  end
end
