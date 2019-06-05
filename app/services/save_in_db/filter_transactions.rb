class SaveInDb::Categories

  SUBSCRIPTION_CLASSIFACTION_CATEGORIES = []

  def self.call(bridge_categories)
    bridge_categories.each do |parent_category|
      parent_category_name = parent_category["name"]
      # parent_category = parent_category["name"]

      parent_category["categories"].each do |category|
        ope_category = OperationCategory.where(bridge_id: category["id"]).first_or_initialize

        ope_category.name = category["name"]
        ope_category.parent_category = parent_category_name
        # ope_category
        ope_category.save

        # OperationCategory.create(
        #   name: category["name"],
        #   bridge_id: category["id"],
        #   parent_category: parent_category_name
        # )
      end
    end
  end
end







id: 280 with name: Subscription - Others
id: 277 with name: Mobile phone
id: 258 with name: Home phone
id: 219 with name: Cable TV
id: 180 with name: Internet
