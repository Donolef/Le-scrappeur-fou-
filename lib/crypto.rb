require 'nokogiri'
require 'open-uri'
 
def perform
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all"))
  cryptos = Array.new 
  valeurs = Array.new 

  page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[3]/div').each do |x|
    cryptos << x.text 
  end

  page.xpath('/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[*]/td[5]/div/a/span').each do |y|
    valeurs << y.text.gsub("$" , "").gsub("," , "")
  end

  cryptos_list = cryptos.zip(valeurs).each_slice(1).map(&:to_h)
end


puts perform
fname = "Dark Trader.txt" 
  somefile = File.open(fname,"w")
  somefile.puts(perform) 
  somefile.close


#/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[2]/td[3]/div

#/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[3]/td[3]/div

#/html/body/div/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[4]/td[3]/div



