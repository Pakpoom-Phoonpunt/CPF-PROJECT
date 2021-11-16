class AccountsController < ApplicationController
    def index
        puts session[:user_id]
    end
    def new
        @account = Account.new
        @departments = Department.all
        @departmentsNameList =[]
        @departments.each{ |department|
            @departmentsNameList << department.name
        }
        @factorys = Factory.all
        @factorysNameList =[]
        @factorys.each{ |factory|
            @factorysNameList << factory.name
        }
        
    end

    def create
        # puts "-------------------------"
        # puts params.require(:username)
        # puts params.require(:password)
        # puts params.require(:factory)
        # puts "-------------------------"
        @factory = Factory.find_by(:name => params.require(:factory))

        @user = Account.new()
        @user.name = params.require(:username)
        @user.username = params.require(:username)
        @user.password = params.require(:password)
        @user.free = true
        @factory.accounts << @user
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            render :new
        end
    end
    
    def show
        
    end
    
    # def manage_shift
    #     puts "----------------------------------------"
    #     puts "wow"
    #     puts "----------------------------------------"
    #     if !params[:departmentId].empty?
    #         redirect_to "/tasks_manage/#{paramsp[:departmentId]}"
    #     end
    # end
    
    def dashboard
        task_list
        @factory = @current_user.factory
        @departments = @factory.departments.all
        @departmentId = Department.get_departmentId(params[:departName])
        
        if params[:date] && params[:departName]
            @tasks = Task.filter_by_date(params[:date], @departmentId)
            # @tasks = []
            # all_task = Task.get_tasks_by_department_name(params[:departName]); #get list of worker 
            # select_time = Time.parse(params[:date]).strftime("%Y-%m-%d");

            # puts params[:departName]
            # all_task.each do |task|  #colloct task on selected day
            #     task_time = task.day.strftime("%Y-%m-%d")
            #    #puts '============task time========='
            #    #puts task_time
            #     if select_time === task_time;
            #        # puts '============same day========='
            #         #puts task_time
            #         #puts task.account_id
            #         #puts select_time
            #         @tasks << task
            #     end
            # end

        end

        # get all workers in :date
        
        respond_to do |format|
            format.js {render layout: false}
            format.json {}
            format.html
        end
    end

    def task_list
        if params[:department]
            @tasks = Department.get_tasklist(params[:department])
            
        else
            @tasks = []
        end
    end 
    
    def adminmanage
        @accounts = Account.all()
    end

    def edit
        @user = Account.find(params[:id])
    end


    def destroy
        begin
            @user = Account.find(params[:id])
            @user.destroy()
            flash[:notice] = "#{@user.username} was Deleted."
            redirect_to "/accounts/#{@current_user.id}/adminmanagepage"
        rescue
            flash[:notice] = "#{@user.title} was Deleted."
            redirect_to "/accounts/#{@current_user.id}/adminmanagepage"
        end
    end

    def update
        @user = Account.find(params[:id])
        @user.role = params[:role]
        @user.save!
        redirect_to "/accounts/#{@current_user.id}/adminmanagepage"
    end
    
    private
    def user_params
        params.require(:account).permit(:username, :password, :role)
    end
end