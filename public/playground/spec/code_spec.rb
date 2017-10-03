require_relative "../lib/code"

describe "bubble sort algorithm" do
  describe "[1,2,3,4,5]" do
  	it "sorts to [1,2,3,4,5]" do
	    expect(bubble_sort([1,2,3,4,5])).to eq([1,2,3,4,5])
  	end
  end
  describe "[1,3,2,4,5]" do
  	it "sorts to [1,2,3,4,5]" do
	    expect(bubble_sort([1,3,2,4,5])).to eq([1,2,3,4,5])
  	end
  end
  describe "[1,4,3,2,5]" do
  	it "sorts to [1,2,3,4,5]" do
	    expect(bubble_sort([1,4,3,2,5])).to eq([1,2,3,4,5])
  	end
  end
  describe "[5,3,2,1,4]" do
  	it "sorts to [1,2,3,4,5]" do
	    expect(bubble_sort([5,3,2,1,4])).to eq([1,2,3,4,5])
  	end
  end
end