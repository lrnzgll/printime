class PeriodValidator < ActiveModel::Validator
  def validate(record)
    return record.errors[:base] << "Periodo non valido" unless record.start_time.present?
  end
end
