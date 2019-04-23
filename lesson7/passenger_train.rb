class PassengerTrain < Train
  attr_reader :type, :number

  def initialize(number)
    @type = :passenger
    @number = number
    super
  end
end
