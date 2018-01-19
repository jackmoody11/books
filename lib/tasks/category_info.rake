desc 'Fetch Categories - Run before rake fetch_courses'
task fetch_categories: :environment do
  require 'nokogiri'
  require 'open-uri'
    url = "http://www.catalog.unc.edu/courses"
    doc = Nokogiri::HTML(open(url))
    category_names = {}
    i = 0
    doc.css('#atozindex li a').each do |category_title|
      # Retrieve information
      category_name = category_title.text[/.+?(?=\s\()/]
      category_shortname = category_title.text[/\A[^.]*\(\K[^.]*(?=\))/]
      category_names[[i, 1]] = category_name
      category_names[[i, 2]] = category_shortname
      # if course does not exist yet, add it
      if Category.where(name: category_name).empty?
        Category.create(shortname: category_shortname,
                        name: category_name)
        puts "Added #{category_shortname} to categories!"
      else
        puts "#{category_shortname} already exists!"
      end
      # Next iteration
      i += 1
    end
end
