class Place < ActiveRecord::Base
  KINDS = ['startup', 'accelerator', 'incubator', 'coworking', 'investor', 'service']

  validates :name, presence: true
  validates :kind, presence: true, inclusion: { in: KINDS }
end
