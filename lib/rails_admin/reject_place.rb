require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class RejectPlace < RailsAdmin::Config::Actions::Base
        register_instance_option :visible? do
          bindings[:object].class.name == 'Place' && bindings[:object].pending?
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :controller do
          Proc.new do
            @object.reject!
            flash[:success] = t('admin.actions.reject_place.flash', name: @object.name)

            redirect_to back_or_index
          end
        end

        register_instance_option :link_icon do
          'icon-ban-circle'
        end

        RailsAdmin::Config::Actions.register(self)
      end
    end
  end
end
