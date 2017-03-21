class Username < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :token
      t.string :email
      t.string :provider
      t.string :image
      t.string :followers
      t.string :following
      t.string :repos
      t.string :public_repos
      t.string :starred
    end
  end
end
