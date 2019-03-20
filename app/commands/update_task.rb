class UpdateTask
  prepend SimpleCommand

  attr_accessor :task, :params

  DIRECTIONS = {
    up: 'up',
    down: 'down'
  }.freeze

  def initialize(task, params)
    @task = task
    @params = params
  end

  def call
    change_position(@params[:move]) if @params[:move]

    @task.update(deadline: @params[:deadline], name: @params[:name], completed: @params[:completed])
  end

  private

  def change_position(direction)
    case direction
    when DIRECTIONS[:up] then @task.move_higher
    when DIRECTIONS[:down] then @task.move_lower
    else false
    end
  end
end
