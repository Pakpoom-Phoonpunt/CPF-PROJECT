class TasksManageController < ApplicationController
    
    def show
        @department = params[:depart]
        @date = params[:date]
        @shift = params[:shift]
        #add to shift
        if params[:accId]
          puts "=========================================================="
          puts "เข้าaddแล้วจ้า"
          assign_task(@department, params[:accId], @date, @shift)
          puts "=========================================================="
        end
        # Display in manage page
        @free_workers = Account.get_free_worker(@date)
        @worker_in_department = Task.filter_task(@date, Department.get_departmentId(params[:departmentName]), @shift, "plan")   #right table 
        @departmentId = Department.get_departmentId(params[:departmentName])
        @department_name = params[:departmentName]

        # if @free_workers.length <= 20
          
        # end

        respond_to do |format|
          format.html {}
          format.js {render action: "show"}
          format.json {}
        end
    end
    
    def manage_shift
      if params[:add]
        assign_task(params[:fworkers])
      elsif params[:delete]
        delete_task(params[:sworkers])
      elsif params[:save]
        assign_ot(params[:sworkers], params[:otTime])
      end
    end

    def delete_task(task_list)
      if task_list
        task_list.each {|x|
          Task.delete_task(x)
        }
      end
    end
    def assign_task(department, worker_list, date, shift)
        if worker_list
          worker_list.each {|x|
            Task.assign_task(department, x, date, shift)
          }
        end
    end
    def assign_ot(worker_list, val)
      begin
         if Float(val) >= 0 && Float(val) <= 24
            worker_list.each{|x|
              Task.assign_ot(x, val)
            }
         end
      rescue 
        flash[:notice] = "Something Wrong"
      end
    end
end
