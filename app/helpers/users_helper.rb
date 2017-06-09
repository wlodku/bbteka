module UsersHelper
  def selected_grade student
    (Grade.pluck(:name).map(&:downcase).include? student[:grade].to_s.downcase) ? Grade.where(name: student[:grade].downcase).first.id : nil
  end


  def build_login student
    student[:name][0..3]+student[:surname][0..3]
  end
end
