class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]

  def create
    @user = User.new(sign_up_params)
    @user.temporary_password = params[:user][:password]
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        format.js {render 'save'}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        format.js { render 'unsave' }
      end
    end
  end

  def update

    pass1 = @user.encrypted_password_was
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    resource_updated = update_resource(resource, account_update_params)

    yield resource if block_given?
    if resource_updated
      pass2 = @user.encrypted_password_was
      if pass1 != pass2
        @user.update(force_change_pass: false, temporary_password: nil)        
      end
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end



  end

  private

    def authenticate_scope!
      send(:"authenticate_#{resource_name}!", force: true)
      self.resource = send(:"current_#{resource_name}")
    end

    def sign_up_params
      params.fetch(:user, {}).permit(:login, :name, :surname, :email, :teacher, :librarian, :grade_id, :role, :password, :password_confirmation, :temporary_password)
    end

    def account_update_params
      params.fetch(:user, {}).permit(:login, :name, :surname, :email, :teacher, :librarian, :grade_id, :role, :password, :password_confirmation, :current_password, :temporary_password)
    end
end
