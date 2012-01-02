module NetSuite
  module FieldSupport

    def self.included(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods

      def fields(*args)
        args.each do |arg|
          field arg
        end
      end

      def field(name)
        name_sym = name.to_sym
        define_method(name_sym) do
          attributes[name_sym]
        end

        define_method("#{name_sym}=") do |value|
          attributes[name_sym] = value
        end
      end

    end

  end
end
