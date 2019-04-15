module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  @@instances = 0

  module ClassMethods
    def self.instances
      @@instances
    end
  end

  module InstanceMethods
    protected
    def register_instance
      self.class.instances += 1
    end
  end
end
