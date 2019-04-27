class ApplicationController < ActionController::Base
   # before_actionにset_current_userメソッドを指定してください
  before_action :set_current_teacher
  before_action :set_current_user
  
  # set_current_userメソッドを定義してください
  def set_current_teacher
    @current_teacher = Teacher.find_by(id: session[:teacher_id])
  end
  
  def authenticate_teacher
    if @current_teacher == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def forbid_login_teacher
    if @current_teacher
      flash[:notice] = "すでにログインしています"
      redirect_to("/teachers/#{@current_teacher.id}/edit")
    end
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
end
