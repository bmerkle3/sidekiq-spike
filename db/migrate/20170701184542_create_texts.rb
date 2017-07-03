class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.string :number
      t.string :body
      t.string :description
      t.datetime :send_at

      t.timestamps
    end
  end
end
