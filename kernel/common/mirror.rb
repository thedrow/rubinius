module Rubinius
  class Mirror
    def self.subject=(klass)
      @subject = klass
    end

    def self.subject
      @subject
    end

    def self.reflect(obj)
      klass = Rubinius.invoke_primitive :module_mirror, obj
      klass.new obj if klass
    end

    def initialize(obj)
      @object = obj
    end

    class Object < Mirror
      subject = ::Object
    end
  end
end
