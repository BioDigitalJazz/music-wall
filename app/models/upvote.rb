

class Upvote < ActiveRecord::Base

  belongs_to :user
  belongs_to :track

  after_create :calculate_upvotes

  private
  def calculate_upvotes
    self.track.calculate_upvotes
  end

end
