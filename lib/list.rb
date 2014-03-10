class List
  def initialize(title)
    @title = title
    @tasks = []
  end

  def title
    @title
  end

  def add_task(task)
    @tasks << task
  end

  def tasks
    @tasks
  end

end
