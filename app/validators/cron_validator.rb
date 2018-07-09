class CronValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value == '*' || options[:inclusion].to_a.include?(value.to_i)
      record.errors.add(attribute, "value not in range: #{options[:inclusion]}")
    end
  end
end
