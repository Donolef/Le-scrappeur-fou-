require 'nokogiri'
require 'open-uri'

def perform
  page = Nokogiri::HTML(URI.open("https://www.dictionnaire-environnement.com/dictionnaire-dechet.php"))

  waste_dictionary = Array.new(0)

  page.xpath('//tr/td/ul/li/a').each.with_index do |link, index|
    complete_url = "https://www.dictionnaire-environnement.com#{link["href"].to_s}"
    dictionary = Nokogiri::HTML(URI.open(complete_url))
    
    title = dictionary.css("h1").text.split(" la ")[0].to_s
    
    begin
    definition = dictionary.xpath('//p[4]/descendant-or-self::text()').text.to_s
    rescue  => e
    definition = "Inconnu"
    end
    
    waste_dictionary[index] = { title => definition }
    
    print "Définition de #{title} - #{definition} \n\n\n"
    sleep (5)

  end

  return waste_dictionary

end

perform
fname = "Def déchets.txt"
  somefile = File.open(fname,"w")
  somefile.puts perform
  somefile.close
  

