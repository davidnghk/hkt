class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: :index 

  def index
  end

  def dashboard
  end 
  
  def demo
  end    

  def protected 
  end

  def calendar 
      start_date = params[:start]
      end_date = params[:end]
      @tasks = Task.where("start_time >= ? AND end_time <= ?", start_date, end_date)
  end

end
