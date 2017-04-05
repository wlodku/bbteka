class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  accepts_nested_attributes_for :author_books

  # filterrific(
  #   default_filter_params: { sorted_by: 'created_at_desc' },
  #   available_filters: [
  #     :search_query
  #   ]
  # )
  #
  # scope :sorted_by, lambda { |sort_key| order(sort_key) }
  #
  #
  #
  # scope :search_query, lambda { |query|
  #   # Filters students whose name or email matches the query
  #
  # }
  #
  # def self.options_for_sorted_by
  # [
  #   ['Name (a-z)', 'name_asc'],
  #   ['Registration date (newest first)', 'created_at_desc'],
  #   ['Registration date (oldest first)', 'created_at_asc']
  # ]
  # end

end
