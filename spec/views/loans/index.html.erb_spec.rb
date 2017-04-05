require 'rails_helper'

RSpec.describe "loans/index", type: :view do
  before(:each) do
    assign(:loans, [
      Loan.create!(),
      Loan.create!()
    ])
  end

  it "renders a list of loans" do
    render
  end
end
