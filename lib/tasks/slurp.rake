namespace :slurp do
  desc "TODO"
  task foodcategories: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "food_categories.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      f = FoodCategory.new
      f.id = row["id"]
      f.created_at = row["created_at"]
      f.updated_at = row["updated_at"]
      f.category = row["category"]
      f.aisle = row["aisle"]
      f.save
    puts "#{f.category} saved"
    end 
    puts "There are now #{FoodCategory.count} rows in the food category table"
  end

end
