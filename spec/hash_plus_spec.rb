require 'rubygems'
require 'rspec'
require 'rspec-expectations'


$:.push File.expand_path("../lib", File.dirname(__FILE__))
require 'hash_plus'

describe Hash do
  context "empty hash" do
    subject(:hash) { Hash.new }
    it { hash.missing_fields(:a).first.should === :a }
    it { hash.missing_fields(:a, :b, :c).should =~ [:a, :b, :c] }
    
    it { expect { hash.requires_fields(:a) }.to raise_error ArgumentError, "Missing value for keys=a in opts={}" }
  end
  
  context "hash containing values" do
    subject(:hash) { {:a => 'b', :c => 'd'} }
    it { hash.missing_fields(:a).should be_empty }
    it { hash.missing_fields(:a, :c).should be_empty }
    it { hash.missing_fields(:a, :b, :c).should =~ [:b] }
    
    it { expect { hash.requires_fields(:b) }.to raise_error ArgumentError, "Missing value for keys=b in opts=#{hash.inspect}" }
  end
  
end
