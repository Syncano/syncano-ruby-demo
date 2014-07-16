(1..5).each do |category_id|
  Category.find_or_create_by(name: "Category #{category_id}")
end