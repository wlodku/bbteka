class DashboardController < ApplicationController
  before_action :check_changed_pass, if: :user_signed_in?

  def index
  end

  private

  def check_changed_pass
    redirect_to edit_user_registration_path, alert: "Logujesz się po raz pierwszy lub Twoje hasło zostało zresetowane. Proszę zmienić hasło." if current_user.force_change_pass
  end
end
