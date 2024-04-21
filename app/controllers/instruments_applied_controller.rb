class InstrumentsAppliedController < ApplicationController
  def show
    @instrument_applied = InstrumentsApplied.find(params[:id])
  end
end