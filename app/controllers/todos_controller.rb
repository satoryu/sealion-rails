class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    Todo.create(todo_params)

    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:content)
  end
end
