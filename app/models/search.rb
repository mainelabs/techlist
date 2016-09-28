class Search < ApplicationRecord
  extend FriendlyId

  validates :page_title, presence: true
  validates :results_one, presence: true
  validates :results_other, presence: true
  validates :slug, presence: true

  friendly_id :slug, use: :slugged

  def results
    results = Place
    results.where(kind: kind) if kind
    results.q(q) if q
    results
  end
end
