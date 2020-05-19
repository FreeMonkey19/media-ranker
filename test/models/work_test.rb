require "test_helper"

describe Work do
  describe "validations" do
    before do 
      work = Work.new(category: "Test Category", creator: "Test Creator", title: "Test Title", publication_year: 2020, description: "Test Description")
      @work = Work.new(category: "Testing Testing Category", creator: "Testing Creator", title: "Testing Title", publication_year: 2019, description: "Testing Description")
    end

    it "it is valid when all fields are present" do
    
      expect(@work.valid?).must_equal true
    end

    it "fails validation when there is a missing field" do
      @work.title = nil

      expect(@work.valid?).must_equal false
    end

    it "fails validation when the title already exists in the same category" do
      Work.create(category: @work.category, creator: @work.creator, title: @work.title, publication_year: @work.publication_year, description: @work.description)

      expect(@work.valid?).must_equal false
   end
  end
end
