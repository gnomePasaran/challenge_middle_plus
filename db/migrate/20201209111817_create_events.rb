class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :event_type, null: false, foreign_key: true, index: true
      t.references :user,       null: false, foreign_key: true, index: true
      t.date       :date,       null: false
      t.time       :start_at,   null: false
      t.time       :finish_at,  null: false
      t.string     :title,      null: false
      t.text       :description

      t.timestamps
    end
  end
end
