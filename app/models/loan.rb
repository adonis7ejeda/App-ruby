class Loan < ApplicationRecord
  has_many :details, dependent: :destroy
  belongs_to :users, optional: true
end
