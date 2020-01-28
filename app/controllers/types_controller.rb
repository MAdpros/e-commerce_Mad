class TypesController < ApplicationController

  def index
    @type = Type.all
  end
end
