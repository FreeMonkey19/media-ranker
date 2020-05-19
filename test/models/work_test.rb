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

    it "fails validation when there is a missing title" do
      @work.title = nil

      expect(@work.valid?).must_equal false
      expect(@work.errors.messages.include?(:title)).must_equal true
      expect(@work.errors.messages[:title].include?("can't be blank")).must_equal true
    end

    it "fails validation when a title already exists in the same category" do
      Work.create(category: @work.category, creator: @work.creator, title: @work.title, publication_year: @work.publication_year, description: @work.description)

      expect(@work.valid?).must_equal false
      expect(@work.errors.messages.include?(:title)).must_equal true
      expect(@work.errors.messages[:title].include?("has already been taken")).must_equal true
   end
   
   it "fails validation when there is a missing category" do
      @work.category = nil

      expect(@work.valid?).must_equal false
      expect(@work.errors.messages.include?(:category)).must_equal true
      expect(@work.errors.messages[:category].include?("can't be blank")).must_equal true
   end

   it "fails validation when there is a missing creator" do
      @work.creator = nil

      expect(@work.valid?).must_equal false
      expect(@work.errors.messages.include?(:creator)).must_equal true
      expect(@work.errors.messages[:creator].include?("can't be blank")).must_equal true
   end

   it "fails validation when there is a missing description" do
      @work.description = nil

      expect(@work.valid?).must_equal false
      expect(@work.errors.messages.include?(:description)).must_equal true
      expect(@work.errors.messages[:description].include?("can't be blank")).must_equal true
   end

   it "fails validation when there is a missing publication_year" do
      @work.publication_year = nil

      expect(@work.valid?).must_equal false
      expect(@work.errors.messages.include?(:publication_year)).must_equal true
      expect(@work.errors.messages[:publication_year].include?("can't be blank")).must_equal true
   end
  end
end
