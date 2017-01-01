class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        # 登入用户，然后重定向到用户的资料页面
        log_in user#sessions_helper中的方法
        redirect_to user
      else
        # 创建一个错误消息
        flash.now[:danger] = '邮箱或密码错误' # 仅在当前页面显示消息,在view中显示
        render 'new'  #render是重新渲染页面
    end
  end
  
  def destroy
    log_out 
    redirect_to root_url 
  end
end
