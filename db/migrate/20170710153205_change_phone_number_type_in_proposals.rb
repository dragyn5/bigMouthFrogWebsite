class ChangePhoneNumberTypeInProposals < ActiveRecord::Migration[5.1]
  def change
    change_column(:proposals, :phone, :string)
  end
end
