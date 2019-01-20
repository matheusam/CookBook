class FixFacebookCollumn < ActiveRecord::Migration[5.2]
  def self.up
   rename_column :users, :faceboook, :facebook
 end
end
