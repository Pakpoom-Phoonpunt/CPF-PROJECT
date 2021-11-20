class TasksManageController < ApplicationController
    
    def show
        @department = params[:departmentName]
        @date = params[:date]
        @shift = params[:shift]
        #add to shift
        if params[:Id] && params[:act]
          if params[:act] == "add"
            assign_task(@department, params[:Id], @date, @shift)
          elsif params[:act] == "delete"
            delete_task( params[:Id], @date, @shift)
          elsif params[:act] == "ot"
            assign_ot( params[:Id], @date, @shift, params[:value])
          end
        end
        
        # Display in manage page
        #search
        if params[:word] && params[:word] != ""
          @free_workers = Account.get_free_worker(@date, params[:word])
        else
          @free_workers = Account.get_free_worker(@date, "")
        end
        @worker_in_department = Task.filter_task(@date, Department.get_departmentId(params[:departmentName]), @shift, "plan")   #right table 
        @departmentId = Department.get_departmentId(params[:departmentName])
        @department_name = params[:departmentName]

        if params[:mobile]
          puts "============== mobile============"
          puts params[:mobile]
          puts params[:freeTable]
          puts "============== mobile============"
          @freeTable = params[:freeTable]
          @mobile = params[:mobile]
        end
          
        # end

        respond_to do |format|
          format.html {}
          format.js {render layout: false}
          format.json {}
        end
    end

    def delete_task(accId_list, date, shift)
      if accId_list
        accId_list.each {|x|
          Task.delete_task(x, date, shift)
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
    def assign_ot(worker_list, date, shift, val)
      begin
         if Float(val) >= 0 && Float(val) <= 24
            worker_list.each{|x|
              Task.assign_ot(x, date, shift, val)
            }
         end
      rescue 
        flash[:notice] = "Something Wrong"
      end
    end
end
