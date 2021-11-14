class TasksManageController < ApplicationController
    def index
        redirect_back fallback_location: "'/accounts/#{@current_user.id}/dashboard' "
    end

    def show
        @free_workers = Account.get_free_worker
    end
end
