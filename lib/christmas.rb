require 'nokogiri'
require 'open-uri'

def get_townhall_urls
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    urls = page.xpath('//*[contains(@class,"lientxt")]/@href').map{|x| x.text[1..-1]}
      urls.length.times do |y|
        urls[y]= "https://www.annuaire-des-mairies.com" + urls[y]
      end
    return urls
end

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
end

def assembly_urls_emails
  urls = get_townhall_urls
  emails = urls.map{|z| get_townhall_email(z)}
end

def cities
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")) 
  names = page.xpath('//a[@class = "lientxt"]').map{|b| b.text}
end

def perform
  names = cities
  emails = assembly_urls_emails
  list_final = names.zip(emails).each_slice(1).map(&:to_h)
  puts list_final
  fname = "Mairie christmas.txt" 
    somefile = File.open(fname,"w")
    somefile.puts(list_final) 
    somefile.close
end

perform


