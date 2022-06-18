module Xirr
  include ActiveSupport::Configurable
 
  config_accessor :eps,                 default: '1.0e-6'.to_f
  config_accessor :period,              default: 365.25
  config_accessor :iteration_limit,     default: 50
  config_accessor :precision,           default: 6
  config_accessor :default_method,      default: :newton_method
  config_accessor :fallback,            default: true
  config_accessor :replace_for_nil,     default: 0.0
  config_accessor :compact,             default: true
  config_accessor :raise_exception,     default: false
  

  # Sets as constants all the entries in the Hash Default values
#   default_values = {
#       eps:             '1.0e-10'.to_f,
#       period:          365.25,
#       iteration_limit: 50,
#       precision:       8,
#       default_method:  :newton_method,
#       fallback:        true,
#       replace_for_nil: 0.0,
#       compact: true,
#       raise_exception: false
#   }

  # Iterates though default values and sets in config
  default_values.each do |key, value|
    const_set key.to_s.upcase.to_sym, self.config.send("#{key.to_sym}")
  end
end
