class TodosController < ApplicationController
  before_action :load_todo_list, only: %i[index create]
  before_action :load_new_todo, only: %i[index create]

  def index
  end

  def create
    @todo = Todo.create(todo_params)

    if turbo_frame_request?
      if @todo.valid?
        @todo = Todo.new

        return render :index
      else
        return render :index, status: :bad_request
      end
    else
      return redirect_to todos_path if @todo.valid?

      render :index, status: :bad_request
    end
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
