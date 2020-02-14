class TypesController < ApplicationController
   before_action :authenticate_manager!, only: [:create, :edit, :update, :destroy]

  def index
    @type = Type.all
  end
end
