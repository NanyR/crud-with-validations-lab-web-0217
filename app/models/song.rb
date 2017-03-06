require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: {less_than_or_equal_to: DateTime.now.year}, if: :released?
  validates :title, uniqueness: { scope: [:artist_name, :release_year]}


end
