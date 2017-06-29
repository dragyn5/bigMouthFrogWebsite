class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :name
      t.string :company
      t.string :website_url
      t.integer :phone
      t.string :email
      t.string :address
      t.text :city
      t.text :state
      t.integer :zip
      t.string :website_goals

      t.timestamps
    end
  end
end
