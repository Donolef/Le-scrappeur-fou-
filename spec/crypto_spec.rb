require_relative '../lib/crypto.rb'

describe "An array of hash should be returned" do
  it "should return an array" do
      expect(perform.class).to eq(Array)
  end
  it "should return an array of hashes" do
    expect(perform[0].class).to eq(Hash)
  end
  it "should return more than 10 value" do
    expect(perform.count).to be >10
  end
end

describe "return first element of symbol_list, and value is not nil" do
  it "should return BTC" do
    expect(perform[0].keys).to eq(["BTC"])
  end
  it "should return value not nil" do
    expect(perform[0]).not_to be_nil
  end
end

