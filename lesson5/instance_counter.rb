module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  @instances ||= 0

  module ClassMethods
  attr_accessor :instances

    def instances
      @instances
    end
  end

  module InstanceMethods
    def register_instance
      self.class.instances += 1
    end
  end
end
