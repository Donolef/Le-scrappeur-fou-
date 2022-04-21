require 'nokogiri'
require 'open-uri'

def perform
  page = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  
  deputes_array = Array.new              
  
  page.xpath('//tr/td/a').each.with_index do |link, index|                 
    complete_url = "https://www2.assemblee-nationale.fr#{link["href"].to_s}"
    deputes = Nokogiri::HTML(URI.open(complete_url))
       
  
  begin
    full_name = deputes.xpath('//h1').text.split(" ")
    last_name = full_name[2].to_s+" "+full_name[3].to_s
    first_name = full_name[1].to_s
  rescue => e
    first_name = "Prénom inconnu"
    last_name = "Nom inconnu"
  end

  begin
    email = deputes.xpath('//*[@id="deputes-contact"]/section/dl/dd[2]/a').text.to_s
  rescue => e
      email = "email Inconnu"
  end

  deputes_array[index] = {"first_name" => first_name, "last_name" => last_name, "email" => email}
       
  puts deputes_array[index]
  end
 return deputes_array
end
    
puts perform
fname = "Cher député.txt" 
  somefile = File.open(fname,"w")
  somefile.puts(perform) 
  somefile.close   


#/html/body/div/div[2]/div/div/div/section[2]/div/div/div/article/div[4]/section/dl/dd[2]/a
#/html/body/div/div[2]/div/div/div/section[2]/div/div/div/article/div[4]/section/dl/dd[2]/a
#/html/body/div/div[2]/div/div/div/section[2]/div/div/div/article/div[3]/section/dl/dd[2]/a
#blairy ; gatel ; petex levet ; rey : pas de mails 