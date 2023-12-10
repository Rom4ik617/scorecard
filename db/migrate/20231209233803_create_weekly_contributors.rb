class CreateWeeklyContributors < ActiveRecord::Migration[7.1]
  def change
    create_table :weekly_contributors do |t|
      t.date :week_start
      t.string :contributor
      t.integer :points

      t.timestamps
    end
  end
end
