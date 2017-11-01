class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # attr_accessor :login
  attr_accessor :add

  # attr_reader :add
  #
  # def add=(string_value)
  #   @add = (string_value == '1')
  # end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :login, uniqueness: { message: ' jest już zajęty'}
  validates_presence_of :grade_id, :name, :surname


   has_many :loans
   has_many :books, through: :loans
   belongs_to :grade, optional: true
   belongs_to :school

   self.per_page = 10

   scope :teachers, -> () { where teacher: true }
   scope :students, -> () { where teacher: [nil, false] }
   scope :librarians, -> () { where librarian: true }

   scope :search_query, lambda { |query|
     return nil  if query.blank?
     # condition query, parse into individual keywords
     terms = query.downcase.split(/\s+/)
     # replace "*" with "%" for wildcard searches,
     # append '%', remove duplicate '%'s
     terms = terms.map { |e|
       (e.gsub('*', '%') + '%').gsub(/%+/, '%')
     }
     # configure number of OR conditions for provision
     # of interpolation arguments. Adjust this if you
     # change the number of OR conditions.
     num_or_conditions = 3
     where(
       terms.map {
         or_clauses = [
           "LOWER(users.name) LIKE ?",
           "LOWER(users.surname) LIKE ?",
           "LOWER(users.email) LIKE ?"
         ].join(' OR ')
         "(#{ or_clauses })"
       }.join(' AND '),
       *terms.map { |e| [e] * num_or_conditions }.flatten
     )
   }

   scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^created_at_/
        order("users.created_at #{ direction }")
      when /^name_/
        order("LOWER(users.surname) #{ direction }, LOWER(users.name) #{ direction }")
      when /^grade_name_/
        order("LOWER(grades.name) #{ direction }").joins(:grade)
        #includes don't work in this case, joins load only data with associations
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
  }

  scope :with_grade_id, lambda { |grade_ids|
    where(:grade_id => [*grade_ids])
  }

  scope :with_created_at_gte, lambda { |ref_date|
    where('users.created_at >= ?', ref_date)
  }

  delegate :name, :to => :grade, :prefix => true

  def self.options_for_sorted_by
    [
      ['Nazwisko (a-z)', 'name_asc'],
      ['Registration date (newest first)', 'created_at_desc'],
      ['Registration date (oldest first)', 'created_at_asc'],
      ['Klasa', 'grade_name_asc']
    ]
  end

  def full_name
    [surname, name].compact.join(', ')
  end

  def decorated_created_at
    created_at.to_date.to_s(:long)
  end

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_grade_id,
      :with_created_at_gte
    ]
  )

  private
  #don't require password repeat
  # def password_required?
  #   new_record? ? super : false
  # end

end
