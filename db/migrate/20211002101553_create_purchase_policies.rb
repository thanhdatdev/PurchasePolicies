class CreatePurchasePolicies < SolidusSupport::Migration[5.1]
  def change
    create_table  :spree_purchase_policies do |t|

      t.belongs_to   :user
      t.belongs_to   :purchase_policy_type
      t.text         :title, limit: 50
      t.text         :content
      t.boolean      :approved, default: false

      t.timestamps
    end
  end
end
