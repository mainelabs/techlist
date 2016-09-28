class Search < ApplicationRecord
  extend FriendlyId

  validates :page_title, presence: true
  validates :results_one, presence: true
  validates :results_other, presence: true
  validates :slug, presence: true

  friendly_id :slug, use: :slugged

  def results(q: nil)
    results = Place
    results = results.where(kind: kind) if kind?
    results = results.q([self.q, q].compact.join(' '))
    results
  end
end
