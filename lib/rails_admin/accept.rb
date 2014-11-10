require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Accept < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          ['PlaceUpdate', 'Place'].include?(bindings[:object].class.name) && bindings[:object].pending?
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :controller do
          Proc.new do
            @object.accept!
            flash[:success] = t("admin.actions.accept_#{@object.class.name.underscore}.flash", name: @object.name)

            redirect_to back_or_index
          end
        end

        register_instance_option :link_icon do
          'icon-ok-circle'
        end

        RailsAdmin::Config::Actions.register(self)
      end
    end
  end
end
