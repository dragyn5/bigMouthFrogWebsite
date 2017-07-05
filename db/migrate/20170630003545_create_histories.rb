class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.boolean :contacted
      t.string :note
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
