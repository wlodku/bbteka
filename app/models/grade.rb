class Grade < ApplicationRecord
  has_many :users

  validates :name, uniqueness: { message: ' nie mogą istnieć klasy o tych samych nazwach'}

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
