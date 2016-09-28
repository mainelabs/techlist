class Search < ApplicationRecord
  validates :page_title, presence: true
  validates :results_one, presence: true
  validates :results_other, presence: true
  validates :slug, presence: true
end
