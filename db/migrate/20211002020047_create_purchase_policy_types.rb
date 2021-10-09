class CreatePurchasePolicyTypes < SolidusSupport::Migration[6.1]
  def change
    create_table :spree_purchase_policy_types do |t|
      t.integer     :user_id
      t.text        :name

      t.timestamps
    end
  end
end
