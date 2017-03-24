class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors

  has_many :loans
  has_many :users, through: :loans

  belongs_to :publisher, optional: true

  # validates :isbn, presence: true
end
