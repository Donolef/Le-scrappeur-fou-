require_relative '../lib/christmas.rb'

describe "get_townhall_email(townhall_url) method, it takes an url and gives back a hash with the email of townhall" do
  it "test good url" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")).to eq("mairie.avernes@orange.fr")
  end
end  


describe "get_townhall_urls method, it takes an url and gives back each url's townhall" do
  it "test good url" do 
    expect(get_townhall_urls().first).to eq("https://www.annuaire-des-mairies.com/95/ableiges.html")
  end
end

describe "An array of hash should be returned" do
  it "should return an array" do
      expect(perform.class).to eq(Array)
  end
  it "should return an array of hashes" do
    expect(perform[0].class).to eq(Hash)
  end
  it "should return more than 10 values" do
    expect(perform.count).to be >10
  end
end