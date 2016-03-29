module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authenticate_admin

    def authenticate_admin
      # TODO Add authentication logic here.
    end
  end
end
