FactoryGirl.define do
  factory :loan do
    book_id 1
    user_id 1
    date_out "2017-02-02"
    date_due "2017-02-02"
    date_returned "2017-02-02"
  end
end
