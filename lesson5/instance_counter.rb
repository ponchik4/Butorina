module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
  attr_accessor :instances

    def instances
      @instances ||= 0
      @instances
    end
  end

  module InstanceMethods
    def register_instance
      self.class.instances += 1
    end
  end
end