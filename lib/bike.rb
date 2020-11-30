# frozen_string_literal: true

# bike class
class Bike
  attr_reader :broken

  def working?
    true unless broken
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end
end
