class TasksController < ApplicationController
	  before_action :authenticate_user!

	def index
		@tasks = current_user.tasks.all.order(position: :ASC)
	end

	def new
		@task = current_user.tasks.new
	end

	def create
		@task = current_user.tasks.new(task_params)
		@task.save!
		redirect_to "/"	
	end

	def sort
		params[:task].each_with_index do |id,index|
			Task.where(id: id).update_all(position: index+1)
		end
		head :ok
	end

	def mark_as_complete
		task_id = params[:id].split("_")[1]
		task = Task.find_by(id: task_id).update_attributes(task_completed: params[:status])
	end

	private

	def task_params
		params.require(:task).permit(:name,:due_date)
	end

end

