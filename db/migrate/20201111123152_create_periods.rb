class CreatePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :periods do |t|
      t.references :job, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamp :start_time, null: false
      t.timestamp :end_time

      t.timestamps
    end
  end
end
