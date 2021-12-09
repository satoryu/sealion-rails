class TodosController < ApplicationController
  before_action :load_todo_list, only: %i[index create]
  before_action :load_new_todo, only: %i[index create]
  before_action :find_todo, only: %i[complete]

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to todos_path
  end

  def index
  end

  def create
    @todo = Todo.create(todo_params)

    return redirect_to todos_path if @todo.valid?

    render :index, status: :bad_request
  end

  def complete
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_path, notice: 'Completed' }
      format.turbo_stream do
        flash.now[:notice] = "'#{@todo.content}' is Completed"
        render :complete, layout: 'application'
      end
    end
  end

  def completed
  end

  private

  def todo_params
    params.require(:todo).permit(:content)
  end

  def load_todo_list
    @todos = Todo.where(completed_at: nil).order(updated_at: :desc)
  end

  def load_new_todo
    @todo = Todo.new
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end
end
