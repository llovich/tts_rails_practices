class AddresssController < ApplicationController
   def index
    @addresses = Address.all
  end


end
