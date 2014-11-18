
class AssociateTables < ActiveRecord::Migration
  def up
    change_table :tracks do |t|
      t.integer :user_id
    end

    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :track_id
    end
  end

  def down
  end
end
