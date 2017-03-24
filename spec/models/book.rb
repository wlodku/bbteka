require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is invalid without isbn' do
    book = Book.new
    # book.should_not be_valid
    expect(book).to_not be_valid
  end
end
