class Task
  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def completed
    @completed = true
  end

  def due_date(date)
    @due_date = date
  end

end

