class SaveInDb::Categories
  def self.call(bridge_categories)
    bridge_categories.each do |parent_category|
      # parent_category = parent_category["name"]
      parent_category["categories"].each do |category|
        ope_category = Category.where(bridge_id: category["id"]).first_or_initialize
        ope_category.name = category["name"]
        ope_category.save
      end
    end
  end
end
