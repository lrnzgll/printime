class JobDecorator < Draper::Decorator
  delegate_all

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

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
