require 'rubygems'
require 'rspec'
require 'rspec-expectations'


$:.push File.expand_path("../lib", File.dirname(__FILE__))
require 'hash_plus'

describe Hash do
  let(:sample_columns) { [:a, :b, :c] }
  
  describe "requires_keys_are_nil" do
    it "shouldn't raise error" do
      hash = {}
      hash.requires_keys_are_nil(*sample_columns)
    end
    
    it "should raise error for 1 column" do
      hash = { :a => 123, :b => nil }
      expect{ hash.requires_keys_are_nil(*sample_columns) }.to raise_error ArgumentError, "Non-Nil values for keys=a in opts=#{hash.inspect}"
    end
    
    it "should raise error for 2 columns" do
      hash = { :a => 123, :b => 456 }
      expect{ hash.requires_keys_are_nil(*sample_columns) }.to raise_error ArgumentError, "Non-Nil values for keys=a,b in opts=#{hash.inspect}"
    end
  end
  
  describe "requires_keys_are_not_nil" do
    it "shouldn't raise error" do
      hash = { :a => 123, :b => 456, :c => 'hello world' }
      hash.requires_keys_are_not_nil(*sample_columns)
    end
    
    it "should raise error for 1 column" do
      hash = { :a => 123, :b => 456, :c => nil }
      expect{ hash.requires_keys_are_not_nil(*sample_columns) }.to raise_error ArgumentError, "Nil values for keys=c in opts=#{hash.inspect}"
    end
    
    it "should raise error for 2 columns" do
      hash = { :a => 123, :b => nil, :c => nil }
      expect{ hash.requires_keys_are_not_nil(*sample_columns) }.to raise_error ArgumentError, "Nil values for keys=b,c in opts=#{hash.inspect}"
    end
  end
  
  describe "requires_keys_are_present" do
    it "shouldn't raise error" do
      hash = { :a => 123, :b => 456, :c => nil }
      hash.requires_keys_are_present(*sample_columns)
    end
    
    it "should raise error for 1 column" do
      hash = { :a => 123, :b => nil }
      expect{ hash.requires_keys_are_present(*sample_columns) }.to raise_error ArgumentError, "Missing keys=c in opts=#{hash.inspect}"
    end
    
    it "should raise error for 2 columns" do
      hash = { :a => 123 }
      expect{ hash.requires_keys_are_present(*sample_columns) }.to raise_error ArgumentError, "Missing keys=b,c in opts=#{hash.inspect}"
    end
  end
  
end
