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
    if params[:evaluateds_ids].present?
      evaluateds_ids = params[:evaluateds_ids]

      create_instruments_applied(evaluateds_ids, instrument)

      redirect_to root_path, notice: 'Instrumento aplicado com sucesso'
    else
      redirect_to select_evaluateds_instrument_path(instrument), alert: 'Nenhum avaliado selecionado'
    end

  end

  private 

  def create_instruments_applied(evaluateds_ids, instrument)
    evaluateds_ids.each do |evaluated_id|
      instrument.instruments_applied.create(evaluated_id: evaluated_id, status: :not_started)
    end
  end

end