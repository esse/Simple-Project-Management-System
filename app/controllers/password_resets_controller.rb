class PasswordResetsController < ApplicationController

  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user
  
  def edit
    render
  end

  def update
    @user_temp.password = params[:user][:password]
    @user_temp.password_confirmation = params[:user][:password_confirmation]
    if @user_temp.save
      flash[:notice] = "Hasło zostało zmienione"
      redirect_to root_url
    else
      render :action => :edit
    end
  end

  def new
    render
  end

  def create
    @user_temp = User.find_by_email(params[:email])
    if @user_temp
      @user_temp.deliver_password_reset_instructions!
      flash[:notice] = "Instrukcja dotycząca zmiany hasła, została wysłana na adres email."
      redirect_to root_url
    else
      flash[:notice] = "Nie znaleziono użytkownika o podanym adresie email."
      render :action => :new
    end
  end

private
  def load_user_using_perishable_token
    @user_temp = User.find_using_perishable_token(params[:id])
    unless @user_temp
      flash[:notice] = "Nie udało się znaleźć konta. " +
      "Spróbuj przekopiować link bezpośrednio z maila, albo " +
      "odzyskać hasło jeszcze raz."   
      redirect_to root_url
    end
  end
  
end