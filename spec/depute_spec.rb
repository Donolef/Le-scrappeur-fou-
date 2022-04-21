require_relative '../lib/depute.rb'

describe "An array of hash should be returned" do
  it "should return an array" do
      expect(perform.class).to eq(Array)
  end
  it "should return an array of hashes" do
    expect(perform[0].class).to eq(Hash)
  end
end