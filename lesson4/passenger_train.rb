class PassengerTrain < Train
  attr_reader :type

  def initialize
    @type = :passenger
    super
  end
end
