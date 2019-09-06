class SnacksController < ApplicationController
  def show
    @snacks = Snack.find(params[:id])
  end
end
