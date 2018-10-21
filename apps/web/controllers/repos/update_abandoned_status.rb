# frozen_string_literal: true

module Web::Controllers::Repos
  class UpdateAbandonedStatus
    include Web::Action
    include Import['services.repos.update_abandoned']

    def call(params)
      if params[:id]
        update_abandoned.call(current_user, params[:id], params[:abandoned])
        redirect_to routes.user_path(current_user.id)
      else
        status 400, 'You must provide the repo id paramater'
      end
    end
  end
end
