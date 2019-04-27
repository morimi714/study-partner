class TeachersController < ApplicationController
  before_action :authenticate_teacher, {only: [:edit, :update]}
  before_action :forbid_login_teacher, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_teacher, {only: [:edit, :update]}

  def index
    @teachers = Teacher.all
    @teacher = Teacher.new(teacher_params)
  end
  
  def new
    @teacher = Teacher.new
  end
  
  def show
    @teacher = Teacher.find_by(id: params[:id])
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = "家庭教師登録が完了しました"
      redirect_to("/teachers/#{@teacher.id}/edit")
    else
      render("teachers/new")
    end
  end
  
  def edit
    @teacher = Teacher.find_by(id: params[:id])
  end
  
  # updateアクションを作成してください
  def update
    @teacher = Teacher.find_by(id: params[:id])
    
    if params[:image]
      @teacher.img = "#{@teacher.id}.jpg"
      image = params[:image]
      File.binwrite("public/teacher_images/#{@teacher.img}", image.read)
    end
    
    if @teacher.update(teacher_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/teachers/#{@teacher.id}")
    else
      flash[:notice] = "編集できませんでした"
      render("teachers/edit")
    end
  end
  
  def login_form
  end
  
  def login
    @teacher = Teacher.find_by(email: params[:email])
    if @teacher && @teacher.authenticate(params[:password])
      session[:teacher_id] = @teacher.id
      flash[:notice] = "ログインしました"
      # redirect_toの場合ははじめにスラッシュを入れる
      redirect_to("/teachers/#{@teacher.id}/edit")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      
      render("teachers/login_form")
    end
  end
  
  def logout
    session[:teacher_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  # ensure_correct_userを定義してください
  def ensure_correct_teacher
    if @current_teacher.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/teachers/login")
    end
  end
  
  private
  def teacher_params
    params.permit(:name, :email, :password, :nickname, :gender, :university, :wage, :trafficwage, :time, :prefecture, :region, :profile, :message)
  end
end
