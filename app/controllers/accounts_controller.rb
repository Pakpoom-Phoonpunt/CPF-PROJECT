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
        @factory = Factory.find_by(:name => params.require(:factory))

        @user = Account.new()
        @user.name = params.require(:username)
        @user.username = params.require(:username)
        @user.password = params.require(:password)
        @user.detail = {"telephone": "#{params.require(:telephone)}"}
        @factory.accounts << @user
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            render :new
        end
    end
    
    def dashboard
        tmp = Time.now
        @date = tmp.strftime("%y-%m-%d")
        time = tmp.strftime("%H:%M")
        if Time.parse(@date+" 8:00") > Time.parse(@date+" "+time) && 
            Time.parse(@date+" "+time) > Time.parse(@date+" 0:00")
            @shift = 1
        elsif Time.parse(@date+" 16:00") > Time.parse(@date+" "+time) && 
            Time.parse(@date+" "+time) > Time.parse(@date+" 8:00")
            @shift = 2
        else 
            @shift = 3
        end

        task_list
        @factory = @current_user.factory
        @departments = @factory.departments.all
        @departmentId = Department.get_departmentId(params[:departName])
        puts "+===================Data details========================="
        puts params[:date]
        puts params[:departName]
        puts params[:shift]
        puts params[:status]
        puts "======================================================="
        if params[:status] === "detail"
            @worker = Account.get_worker_by_id(params[:account_id])
        end
        if params[:date] && params[:departName]
            @tasks = Task.filter_task(params[:date], @departmentId, params[:shift], params[:status], "")
            @actual_worker = Task.number_worker(@departmentId, params[:date], params[:shift], "actual")
            @all_worker = Task.number_worker(@departmentId, params[:date], params[:shift], "plan")
        end
                
        respond_to do |format|
            format.js {render layout: false}
            format.json {}
            format.html { }
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

    def show
        @tasks = @current_user.tasks
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
        redirect_to "/accounts/#{@current_user.id}/manage_Worker"
    end
    
    def factory_manage
        @factories = Factory.get_all_factory

    end

    def mytasks
        @tasks = @current_user.tasks
    end
    def editFactory
        puts params[:facId]
        @factory = Factory.find_by_id(params[:facId])
        @departments = @factory.departments

    end

    def create_department
        department_name = params.require(:name)
        fac_id = params[:facId]
        Department.create_department(fac_id, department_name)
        
        redirect_to "/manage_factories/edit/#{params[:facId]}"
    end
    
    def new_factory
        @factory = Factory.new()
    end

    def add_factory
        factory_name = params.require(:name)
        @factory = Factory.new(:name => factory_name)
        @factory.save!
        redirect_to "/accounts/#{@current_user.id}/manage_factories"
    end
    private
    def user_params
        params.require(:account).permit(:username, :password, :role)
    end

end