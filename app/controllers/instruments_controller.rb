class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def select_evaluateds
    @instrument = Instrument.find(params[:id])
    @evaluateds = Evaluated.all
  end

  def apply
    instrument = Instrument.find(params[:id])
    evaluateds_ids = params[:evaluateds_ids]

    evaluateds = Evaluated.where(id: evaluateds_ids)

    evaluateds.each do |evaluated|
      instrument.instruments_applied.create(evaluated: evaluated, status: :not_started)
    end

    redirect_to root_path, notice: 'Instrumento aplicado com sucesso'
  end

end