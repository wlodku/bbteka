class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  accepts_nested_attributes_for :author_books

  has_many :loans
  has_many :users, through: :loans

  belongs_to :publisher, optional: true

  # validates :isbn, presence: true
  searchkick
end
