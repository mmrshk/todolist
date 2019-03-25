class UpdateTaskPosition
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
    case @params[:position]
    when DIRECTIONS[:up] then @task.move_higher
    when DIRECTIONS[:down] then @task.move_lower
    end
  end
end
