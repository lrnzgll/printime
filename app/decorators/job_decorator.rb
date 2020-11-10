class JobDecorator < Draper::Decorator
  delegate_all

  def created_at_month
    object.created_at.strftime("%b")
  end

  def created_at_day
    object.created_at.strftime("%e")
  end

  def created_at_year
    object.created_at.strftime("%Y")
  end

  def created_at_time
    object.created_at.strftime("%H:%M")
  end
  def last_updated_month
    object.updated_at.strftime("%b")
  end

  def last_updated_day
    object.updated_at.strftime("%e")
  end

  def last_updated_year
    object.updated_at.strftime("%Y")
  end

  def last_updated_time
    object.updated_at.strftime("%H:%M")
  end

  def submit_value
    object.persisted? ? "Modifica" : "Crea"
  end
end
