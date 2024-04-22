class InstrumentsApplied < ApplicationRecord
  belongs_to :instrument
  belongs_to :evaluated

  enum status: {
    not_started: 'Não iniciado',
    finished: 'Finalizado',
  }

  def finish!
    update(status: :finished)
  end
end
