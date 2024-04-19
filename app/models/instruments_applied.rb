class InstrumentsApplied < ApplicationRecord
  belongs_to :instrument
  belongs_to :evaluated

  enum status: {
    not_started: 'not_started',
    finished: 'finished'
  }
end
