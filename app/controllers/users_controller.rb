class UsersController < ApplicationController

  def new
  end

  def create
    User.create(name: params[:name], email: params[:email], password: params[:password], first_name_kannji: params[:first_name_kannji], last_name_kannji: params[:last_name_kannji], first_name_katakana: params[:first_name_katakana], last_name_katakana: params[:last_name_katakana], birth_day: params[:birthday])
  end
end
