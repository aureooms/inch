module Inch
  module CodeObject
    module Proxy
      # Proxy class for methods
      class MethodObject < Base
        def constructor?
          self[:constructor?]
        end

        def bang_name?
          self[:bang_name?]
        end

        def getter?
          self[:getter?]
        end

        def has_parameters?
          !parameters.empty?
        end

        MANY_PARAMETERS_THRESHOLD = 3
        def has_many_parameters?
          parameters.size > MANY_PARAMETERS_THRESHOLD
        end

        MANY_LINES_THRESHOLD = 20
        def has_many_lines?
          # for now, this includes the 'def' line and comments
          if source
            size = source.lines.count
            size > MANY_LINES_THRESHOLD
          else
            false
          end
        end

        def parameters
          self[:parameters]
        end

        def overridden?
          self[:overridden?]
        end

        def overridden_method

        end

        def return_mentioned?
          self[:return_mentioned?]
        end

        def return_described?
          self[:return_described?]
        end

        def return_typed?
          self[:return_typed?]
        end

        def setter?
          self[:setter?]
        end

        def source
          self[:source?]
        end

        def questioning_name?
          self[:questioning_name?]
        end
      end
    end
  end
end
