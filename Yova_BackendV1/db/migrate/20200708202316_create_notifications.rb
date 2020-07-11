class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.date :date
      t.string :title
      t.text :description
      t.references :client, foreign_key: true
      t.boolean :isRead

      t.timestamps
    end
  end
end
