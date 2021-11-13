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
    
    def manage_shift
        if !params[:departmentId]
            id = 0
        else
            id = params[:departmentId]
        end
        redirect_to "/tasks_manage/#{id}"
    end
    
    def dashboard
        task_list
        @factory = @current_user.factory
        @departments = @factory.departments.all
        @departmentId = Department.get_departmentId(params[:department])
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

    
    private
    def user_params
        params.require(:account).permit(:username, :password, :role)
    end
end