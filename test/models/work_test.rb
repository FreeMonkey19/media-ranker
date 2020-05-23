require "test_helper"

describe Work do

 

    before do 
      @album1 = works(:album1)
      @album2 = works(:album2)
      @album3 = works(:album3)
      @user1 = users(:user1)
      @user2 = users(:user2)
      @user3 = users(:user3)
    end

      it "it is valid when all fields are present" do
        expect(@album1.valid?).must_equal true
      end

      it "will have the required fields" do
        [:category, :title, :creator, :publication_year, :description].each do |field|
          expect(@album1).must_respond_to field
      end
    end
    
  describe "validations" do
    let (:new_album) {
      Work.new(
        category: "album",
        title: "new album title",
        creator: "new album creator",
        publication_year: 2020,
        description: "new album description"
      )
    }
    
    it "fails validation when there is a missing title" do
      new_album.title = nil

      expect(new_album.valid?).must_equal false
      expect(new_album.errors.messages.include?(:title)).must_equal true
      expect(new_album.errors.messages[:title].include?("can't be blank")).must_equal true
    end
    
    it "fails validation when there is a missing category" do
      new_album.category = nil

      expect(new_album.valid?).must_equal false
      expect(new_album.errors.messages.include?(:category)).must_equal true
      expect(new_album.errors.messages[:category].include?("can't be blank")).must_equal true
   end
 

   it "fails validation when there is a missing creator" do
      new_album.creator = nil

      expect(new_album.valid?).must_equal false
      expect(new_album.errors.messages.include?(:creator)).must_equal true
      expect(new_album.errors.messages[:creator].include?("can't be blank")).must_equal true
   end
 

   it "fails validation when there is a missing description" do
      new_album.description = nil

      expect(new_album.valid?).must_equal false
      expect(new_album.errors.messages.include?(:description)).must_equal true
      expect(new_album.errors.messages[:description].include?("can't be blank")).must_equal true
   end
 

   it "fails validation when there is a missing publication_year" do
      new_album.publication_year = nil

      expect(new_album.valid?).must_equal false
      expect(new_album.errors.messages.include?(:publication_year)).must_equal true
      expect(new_album.errors.messages[:publication_year].include?("can't be blank")).must_equal true
   end

   it "fails validation when a title already exists in the same category" do
    new_album.title = @album1.title

    expect(new_album.valid?).must_equal false
    expect(new_album.errors.messages.include?(:title)).must_equal true
    expect(new_album.errors.messages[:title].include?("has already been taken")).must_equal true
   end

   it "passes validation with same title but two different categories" do
      Work.create!(category: "book", title: new_album.title, creator: new_album.creator, publication_year: 2020, description: "new book same title as album")

      expect(new_album.valid?).must_equal true
      expect(new_album.errors.messages).must_be_empty
   end
  end

  describe "relations" do
    it "can have many votes" do
      expect(@album2.votes.count).must_equal 3
      @album2.votes.each do |vote|
        expect(vote).must_be_instance_of Vote
      end
    end
  end
end
  

