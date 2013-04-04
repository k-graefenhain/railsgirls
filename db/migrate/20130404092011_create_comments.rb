class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name
      t.text :body
      t.integer :idea_id

      t.timestamps

      #add_foreign_key :comments, :ideas
      # fixed issue with foreigner on herokus, see http://stackoverflow.com/questions/15556311/when-running-migrations-on-heroku-i-get-pgerror-error-relation-member1-id
      t.foreign_key :ideas, :dependent => :delete
    end
  end
end
