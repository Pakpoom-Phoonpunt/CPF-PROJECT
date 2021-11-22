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
        @user.free = true
        @factory.accounts << @user
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path 
        else
            render :new
        end
    end
    
    def dashboard
        task_list
        @factory = @current_user.factory
        @departments = @factory.departments.all
        @departmentId = Department.get_departmentId(params[:departName])
        puts "===================Data details========================="
        puts params[:date]
        puts params[:departName]
        puts params[:shift]
        puts params[:status]
        puts "======================================================="
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
        redirect_to "/accounts/#{@current_user.id}/adminmanagepage"
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
        puts "=======check fac department==========="
        puts @factory.departments
        puts "====================================="
    end

    
    private
    def user_params
        params.require(:account).permit(:username, :password, :role)
    end

end