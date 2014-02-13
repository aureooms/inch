module Inch
  module CodeObject
    module Provider
      module YARD
        module Object
          # a namespace object can have methods and other namespace objects
          # inside itself (e.g. classes and modules)
          class NamespaceObject < Base
            def child(name)
              if children
                children.detect { |child| child.name == name }
              end
            end

            def children
              object.children.map do |o|
                YARD::Object.for(o)
              end
            end

            MANY_ATTRIBUTES_THRESHOLD = 5
            def has_many_attributes?
              n = object.class_attributes.size + object.instance_attributes.size
              n > MANY_ATTRIBUTES_THRESHOLD
            end

            MANY_CHILDREN_THRESHOLD = 20
            def has_many_children?
              children.size > MANY_CHILDREN_THRESHOLD
            end

            def namespace?
              true
            end

            def has_methods?
              children.any?(&:method?)
            end

            def pure_namespace?
              children.all?(&:namespace?)
            end
          end
        end
      end
    end
  end
end
