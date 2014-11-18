
class AddUpvoteCount < ActiveRecord::Migration
  def up
    change_table :tracks do |t|
      t.integer :num_upvotes
    end
  end

  def down
  end
end
