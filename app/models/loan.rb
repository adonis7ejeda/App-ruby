class Loan < ApplicationRecord
  belongs_to :users
  has_many :details
end
