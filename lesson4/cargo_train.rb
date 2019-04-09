class CargoTrain < Train
  attr_reader :type, :number

  def initialize(number)
    @type = :cargo
    super
  end
end
