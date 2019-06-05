def extract_catagories_list
  catagories_list = Bridge::Users::ListAllCategories.call
  catagories_list.first
end
