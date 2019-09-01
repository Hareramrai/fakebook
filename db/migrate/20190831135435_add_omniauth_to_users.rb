class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      t.column :provider, :string
      t.column :uid, :string
      t.column :token, :string
      t.column :refresh_token, :string
      t.column :expires, :boolean
      t.column :expires_at, :integer
      t.column :profile_picture, :string
      t.index  [:uid, :provider], unique: true
    end
  end
end
