# frozen_string_literal: true

module InputField
  Item = Struct.new(
    :id,
    :name,
    :label,
    :type,
    :icon_class,
    :placeholder,
    :required,
    :value,
    keyword_init: true,
  )
end
