module Xirr
  include ActiveSupport::Configurable
 
  config_accessor :eps do '1.0e-6'.to_f end
  config_accessor :period do 365.25 end
  config_accessor :iteration_limit do  50 end
  config_accessor :precision      do 6 end
  config_accessor :default_method do :newton_method end
  config_accessor :fallback       do true end
  config_accessor :replace_for_nil do 0.0 end
  config_accessor :compact        do true end
  config_accessor :raise_exception do false end
  

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
