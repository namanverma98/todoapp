class TasksController < ApplicationController

	def index
		@tasks = current_user.tasks.all.order(created_at: :desc)
	end

	def new
		if current_user.present?
			@task = current_user.tasks.new
		else
			redirect_to "/"
		end
	end

	def create
		if current_user.present?
			@task = current_user.tasks.new(name: params[:task][:name],due_date: params[:task][:due_date])
			@task.save!
			redirect_to "/"
		else
			redirect_to "/"
		end	
	end
end
