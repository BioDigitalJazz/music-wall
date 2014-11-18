

class Track < ActiveRecord::Base

  belongs_to :user
  has_many :upvotes

  def calculate_upvotes
    self.num_upvotes = self.upvotes.count
    self.save
  end

end