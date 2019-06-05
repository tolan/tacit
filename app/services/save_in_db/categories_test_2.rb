class SaveInDb::Categories
  def self.call(bridge_categories)
    bridge_categories.each do |parent_category|
      parent_category = parent_category["name"]

      parent_category["categories"].each do |category|
        ope_category = OperationCategory.where(bridge_id: category["id"]).first_or_initialize

        ope_category.name = category["name"]
        ope_category.parent_category = parent_category_name
        ope_category.save
        # ope_category.save

        # OperationCategory.create(
        #   name: category["name"],
        #   bridge_id: category["id"],
        #   parent_category: parent_category_name
        # )
      end
    end
  end
end
