#< is inheritience...this says that say inherits from app
class SayController < ApplicationController
  def hello
    @current_time = Time.new
  end

  def goodbye
  end
end
