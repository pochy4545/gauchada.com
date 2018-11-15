class IndexController < ApplicationController
  def index
  	@gauchadas = Gauchada.all
  end
end
