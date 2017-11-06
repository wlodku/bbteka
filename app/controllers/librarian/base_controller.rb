
module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user

    private

    def authenticate_user
        # ...
    end
  end



end
