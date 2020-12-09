class CreateEventTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_types do |t|
      t.string :title, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
