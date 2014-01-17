module Inch
  module Evaluation
    module Role
      # Missing is the base class for things that can be improved in the doc
      #
      class Missing < Base
        def score
          nil
        end

        # @return [Float]
        #  a score that can be achieved by adding the missing thing mentioned
        #  by the role
        def potential_score
          @value.to_f
        end
      end
    end
  end
end
