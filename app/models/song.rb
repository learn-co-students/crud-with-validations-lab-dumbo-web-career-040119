class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validate :no_future_year
  validate :no_year_when_unreleased


  private
  def no_future_year
    if release_year
      errors.add(:release_year, "can't be in the future!") if release_year > Time.now.year.to_i
    end
  end

  def no_year_when_unreleased
    if released
      errors.add(:release_year, "must exist!") if !release_year
    end
  end

end
