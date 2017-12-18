desc "Fetch Course Info - Run rake fetch_categories before running rake fetch_courses"
task :fetch_courses => :environment do
  require "nokogiri"
  require "open-uri"
  categories = Category.all
  categories.each do |category|
    shortname = category.shortname.downcase
    url = "http://www.catalog.unc.edu/courses/#{CGI.escape(shortname)}"
    doc = Nokogiri::HTML(open(url))
    course_titles = Hash.new
    i = 0
    doc.css(".courseblocktitle strong").each do |title|
      # Retrieve information
      course_shortname = title.text[/^([^.]+)/]
      course_description = title.text[/\A[^.]*\.\s\K[^.]*(?=\.)/]
      course_titles[[i,1]] = course_shortname
      course_titles[[i,2]] = course_description
      # if course does not exist yet, add it
      if Course.where(shortname: course_shortname).empty?
        Course.create(shortname: course_shortname, description: course_description, category_ids: category.id)
        puts "Added #{course_shortname} to courses with category: #{category.id}!"
      else
        puts "#{course_shortname} already exists!"
      end
      # Next iteration
      i=i+1
    end
  end
end