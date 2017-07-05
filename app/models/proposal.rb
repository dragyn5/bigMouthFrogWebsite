class Proposal < ApplicationRecord
  has_many :histories, dependent: :destroy

  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :email, presence: true,
                    length: { minimum: 7 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: " must be valid" }                    
 
  validates :state, presence: true,
                    length: { minimum: 2 }                             
end
