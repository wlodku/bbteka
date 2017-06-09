require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/ascii_outputter'
require "prawn"



class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token
  before_action :check_changed_pass, if: :user_signed_in?

  # GET /users
  # GET /users.json
  def index

    # @posts = Post.paginate(:page => params[:page])
    # @users = User.students.paginate(page: params[:page])

    @filterrific = initialize_filterrific(
      User.includes(:grade),
      params[:filterrific],
      :select_options => {
        sorted_by: User.options_for_sorted_by,
        with_grade_id: Grade.options_for_select
      }
    ) or return
    @users = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        pdf = Barcode.new(@filterrific.find, params[:barcode])
        send_data pdf.render, filename: "qwe.pdf", type: 'application/pdf'
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Barcode.new(@user)
        send_data pdf.render, filename: "qwe.pdf", type: 'application/pdf'
      end
    end
    # barcode = Barby::Code128B.new('BARBY')
    #
    # puts barcode.to_ascii #Implicitly uses the AsciiOutputter
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js {render :save}
      else
        @users = User.students.paginate(page: params[:page])
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      pass1 = @user.encrypted_password_was
      # logger.debug("Przed: #{@user.encrypted_password_changed?}")
      @user.temporary_password = params[:user][:password]
      if @user.update(user_params)
        # logger.debug("Po: #{@user.encrypted_password_changed?}")
        pass2 = @user.encrypted_password_was
        @user.update(force_change_pass: true) if pass1 != pass2;

        @users = User.students.paginate(page: params[:page])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render 'unsave' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Użytkownik usunięty.' }
      format.json { head :no_content }
    end
  end

  def live_search
    @users = User.find_latest params[:q]
    render :layout => false
  end

  def import
  end

  def upload
    uploaded_io = params[:file]
    # require 'open-uri'
    doc = Nokogiri::HTML(open(uploaded_io).read)
    @students = []
    students_nodes = doc.xpath("//uczen")
    students_nodes.each do |sn|
      student = {:name => sn[:imie]}
      student[:surname] = sn[:nazwisko]
      place = sn.css("miejsce")
      student[:grade] = place.attr("poziom").to_s+place.attr("symbol").to_s unless place.empty?
      @students << student
    end
    # places = @students.css("miejsce")

    # places.each {|p| @grades << p[:poziom]+p[:symbol]}
    logger.info("students: #{@students}")
    @errors = []
    @new = []
    @students.count.times do
      @new << User.new
    end
    # logger.info("students: #{@students}")
    # logger.info("studentsimie: #{@students[0]['imie']}")

    # students.each do |node|
    #   User.create(id: node['id'][1..-1].to_i, name: node['name'], short: node['short'], color: node['color'])
    # end


    # groups = doc.xpath("//group")
    # squads = doc.xpath("//class")
    # classrooms = doc.xpath("//classroom")
    # cards = doc.xpath("//card")
    # lessons = doc.xpath("//lesson")
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end
    # head :ok, content_type: "text/html"
    # render 'import'
  end

  def import_create
    users = []
    @errors = []
    @students = []
    @new = []
    logger.debug("new: #{@new}")

    params["users"].each do |user|
      if user["add"] == "1"
        u = User.new(name: user["name"], surname: user["surname"], login: user["login"], grade_id: user["grade_id"], email: Faker::Internet::email+((1..100000).to_a).sample.to_s, password: "mamamama", password_confirmation: "mamamama")
        if u.valid?
          users << u
        else
          @new << User.new
          @students << {add: user["add"], name: user["name"], surname: user["surname"], grade_id: user["grade_id"], login: user["login"]}          
          @errors << u.errors
          logger.debug("Debuk: #{@students}")
        end
      end
    end
    User.import users
    if @errors.empty?
      flash[:notice] = "Dodano #{users.count} użytkowników"
      redirect_to users_path
    else
      flash.now[:notice] = "Dodano #{users.count} użytkowników" if users.count > 0
      flash.now[:alert] = "Nie dodano #{@new.count}/#{@new.count+users.count} użytkowników, przejrzyj i popraw błędy:"

      logger.debug("Buendy: #{@errors}")
      logger.debug("@students[0][:imie]: #{@students[0][:imie]}")

      render 'upload'
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {}).permit(:add, :login, :name, :surname, :email, :teacher, :librarian, :grade_id, :role, :password, :password_confirmation, :temporary_password)
    end

    def users_params(my_params)
      my_params.permit(:add, :login, :name, :surname, :email, :teacher, :librarian, :grade_id, :role, :password, :password_confirmation, :temporary_password)
    end


    def check_changed_pass
      redirect_to edit_user_registration_path, alert: "Logujesz się po raz pierwszy lub Twoje hasło zostało zresetowane. Proszę zmienić hasło." if current_user.force_change_pass
    end


end
