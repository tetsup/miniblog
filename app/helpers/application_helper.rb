module ApplicationHelper
  def value_or_zero(value)
    value.nil? ? 0 : value
  end
end
