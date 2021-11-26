class TodosController < ApplicationController
  before_action :load_todo_list, only: %i[index create]
  before_action :load_new_todo, only: %i[index create]

  def index
  end

  def create
    Todo.create(todo_params)

    return render :index if turbo_frame_request?

    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:content)
  end

  def load_todo_list
    @todos = Todo.all
  end

  def load_new_todo
    @todo = Todo.new
  end
end
