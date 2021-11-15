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
        @department = Department.find(@departmentId)
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
    
    def manage_shift
      if params[:add]
        assign_task(params[:fworkers])
      elsif params[:delete]
        delete_task(params[:sworkers])
      elsif params[:save]
        puts "------------------"
        puts params[:sworkers]
        puts "------------------"
        assign_ot(params[:sworkers], params[:otTime])
      end
    end

    def delete_task(task_list)
      if task_list
        task_list.each {|x|
          Task.delete_task(x)
        }
      end
      redirect_to "/tasks_manage/#{params[:id]}/"
    end
    def assign_task(worker_list)
        if worker_list
          worker_list.each {|x|
            Task.assign_task(params[:id], x, Time.now, 1)
          }
        end
        redirect_to "/tasks_manage/#{params[:id]}/"
    end
    def assign_ot(worker_list, val)
      begin
         if Float(val) >= 0 && Float(val) <= 24
            worker_list.each{|x|
              Task.assign_ot(x, val)
            }
         end
          redirect_to "/tasks_manage/#{params[:id]}/"
      rescue
        redirect_to "/tasks_manage/#{params[:id]}/"
      end
    end
end
