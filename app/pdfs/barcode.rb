require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'
require 'barby/outputter/prawn_outputter'

class Barcode < Prawn::Document
  def initialize(users, print_barcode)
    # super(top_margin: 15, bottom_margin: 10, left_margin: 20, right_margin: 20, page_size: 'A4')
    super({
     :top_margin => 70,
     :page_size => 'A4',
     :font_size => 10,
     :text  => 8
     })
     font_families.update(
         "my_font" => { :bold => "#{Rails.public_path}/fonts/verdana_bold.ttf",
                                 :italic      => "#{Rails.public_path}/fonts/verdana.ttf",
                                 :bold_italic => "#{Rails.public_path}/fonts/verdana.ttf",
                                 :normal      => "#{Rails.public_path}/fonts/verdana.ttf" })
     font "my_font"
     @users = users
     cards if print_barcode == 'true'
     logins if print_barcode == 'false'
  end

  def cards

    @users.each do |u|
      bounding_box([100, cursor-20], width: 180, height: 80) do
        stroke_bounds
        move_down(5)
        font_size(10) { text "www.bbteka.net/ckziu-jaw", align: :center}
        move_down(50)
        font_size(10) { text "#{u.name} #{u.surname}", align: :center}
      end
      barcode = Barby::Code128.new u.id.to_s
      barcode.annotate_pdf(self, x: 160, y: cursor+15)

      start_new_page if cursor < 150


      # img = Barby::PngOutputter.new(barcode).to_png

      # move_down(20)


      # @blob = Barby::PngOutputter.new(barcode).to_png #Raw PNG data
      # image File.open('barcode.png', 'r'){|f| f.read img }
      # image open(img)
      # image File.open('barcode2.png', 'wb'){|f| f.write img }
    end

  end
  def logins
    @users.each do |u|
      # barcode = Barby::Code128.new u.id.to_s
      # img = Barby::PngOutputter.new(barcode).to_png
      # barcode.annotate_pdf(self)
      # move_down(20)
      pass = u.force_change_pass ? u.temporary_password : '********'
      font_size(10) { text "#{@print_barcode} #{u.name} #{u.surname} - Login: #{u.login }, Hasło: #{pass} ", align: :left}
      # image open(img)
      # image File.open('barcode2.png', 'wb'){|f| f.write img }
    end
  end

end
