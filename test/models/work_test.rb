require "test_helper"

describe Work do
  describe "validations" do
    before do 
      work = Work.new(category: "Test Category", creator: "Test Creator", title: "Test Title", publication_year: 2020, description: "Test Description")
      @work = Work.new(category: "Testing Testing Category", creator: "Testing Creator", title: "Testing Title", publication_year: 2019, description: "Testing Description")
    end

    it "it is valid when all fields are present" do
     result = @work.valid?

      expect(result).must_equal true
    end
  end
end
