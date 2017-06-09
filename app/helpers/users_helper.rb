module UsersHelper
  def selected_grade student
    # logger.debug("Grade.pluck: #{Grade.pluck(:name).map(&:downcase)}")
    # logger.debug("student[:grade]: #{student[:grade].downcase}")
    (Grade.pluck(:name).map(&:downcase).include? student[:grade].to_s.downcase) ? Grade.where(name: student[:grade].downcase).first.id : nil
  end
end
