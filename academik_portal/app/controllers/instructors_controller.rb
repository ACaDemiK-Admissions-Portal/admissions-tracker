class InstructorsController < ApplicationController

  def login
    admin_user = Instructor.find_by(email: params['email'])
    if admin_user && admin_user.authenticate(params['password'])
      session[:user_name] = admin_user.name
      @name = sessions[:user_name]

      cookies[:name] = instructor.name
      cookies[:age_example] = {:value => "I expire in 10 seconds", :expires => Time.now + 10}
      render :index
    else
      @error = true
      render :index  
    end  
  end

  def index
  	@students = Student.where(application_status: 'In-Person Interview Pending')
  end

  # def show
  # 	id = params[:id]
  # 	@student = Student.find(id)
  # end

  # def edit
  # end

  # def update
  # end

end