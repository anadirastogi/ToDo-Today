class TodosController < ApplicationController

 def index
    if session[:user_id] == nil
      flash[:error]="Login to continue"
      redirect_to "/users/login" and return
    end

    @user = session[:user_id]
    @todo_items = Todo.all 
    @new_todo = Todo.new
    #render :nothing=>true
 end

  def add
    todo=Todo.create(:todo_item => params[:todo][:todo_item])
    unless todo.valid?
     flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
     flash[:success] = "Todo added successfully"   
    end       
    redirect_to :action => 'index'
  end
  
  def complete
    params[:todos_checkbox].each do |check|
      todo_id=check
      t=Todo.find_by_id(todo_id)
      t.destroy
    end
    redirect_to :action => 'index'
  end


end
