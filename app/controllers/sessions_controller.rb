class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Has iniciado sesión satisfactoriamente"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Se ha producido algun error en el inicio de tu sesión. Revisa los datos introducidos y vuelve a intentarlo"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Has cerrado la sesión satisfactoriamente"
    redirect_to root_path
  end

end
