class TasksManageController < ApplicationController
    def index
        redirect_back fallback_location: "/accounts/#{@current_user.id}/dashboard"
    end
    
    def action
        @departmentId = params[:id]
        respond_to do |format|
          format.js
        end
      end
    
    def show
        @free_workers = Account.get_free_worker
        @departmentId = params[:id]
        @task_list = Task.get_tasks(params[:id])
        puts "----------"
        puts params[:id]
        puts "----------"
        if params[:test]
          puts "BooYahhh"
          puts params[:test]
        end 
        respond_to do |format|
          format.html
          format.js {}
          format.json {}
        end
    end    
end
