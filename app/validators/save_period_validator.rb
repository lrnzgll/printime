class SavePeriodValidator < ActiveModel::Validator
  def validate(record)
    return record.errors[:base] << "Periodo non valido" unless
      creating_active_period(record) || creating_ended_period(record)

  end

  private

  def creating_active_period(record)
    record.job.periods.active.none?
  end

  def creating_ended_period(record)
    record.end_time.present?
  end
end
