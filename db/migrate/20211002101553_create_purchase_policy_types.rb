class CreatePurchasePolicyTypes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :spree_purchase_policy_types do |t|
      t.integer :user_id
      t.integer :purchase_policy_id
      t.text    :name

      t.timestamps
    end
  end

  def self.down
    drop_table :spree_purchase_policy_types
  end
end
