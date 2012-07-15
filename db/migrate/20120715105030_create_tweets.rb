class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :author
      t.text :content
      t.datetime :when

      t.timestamps
    end
  end
end
