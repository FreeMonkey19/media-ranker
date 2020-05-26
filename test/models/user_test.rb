require "test_helper"

describe User do
  let (:new_user){
    User.new(name: "Mickey Mouse")
  }

  it "can be created/instantiated" do

    expect(new_user.valid?).must_equal true
  end

  it "will have the required name field" do
 
    new_user.save
    user = User.first
    [:name].each do |field|
      expect(user).must_respond_to field
    end
  end

  describe "validations" do
    it "must have a name" do
  
      new_user.name = nil
      
      expect(new_user.valid?).must_equal false
      expect(new_user.errors.messages).must_include :name
      expect(new_user.errors.messages[:name]).must_equal ["can't be blank"]
    end
  end 

  describe "relations" do
    it "has many votes and works through votes" do
  
      new_user.save
      first_Work = Work.create!(
        category: "book",
        creator: "Chariere",
        title: "Papillon",
        publication_year: "1969",
        description: "Prison escape"
      )

      second_Work = Work.create!(
        category: "book", 
        creator: "Zuckerbrot",
        title: "The F Factor Diet",
        publication_year: "2006",
        description: "Weight loss"
      )
      first_Vote = Vote.create!(user_id: new_user.id, work_id: first_Work.id)
      second_Vote = Vote.create!(user_id: new_user.id, work_id: second_Work.id)
      
     
      expect(new_user.votes.count).must_equal 2
      new_user.votes.each do |vote|
        expect(vote).must_be_instance_of Vote
      end

      expect(new_user.works.count).must_equal 2
      new_user.works.each do |work|
        expect(work).must_be_instance_of Work
      end
    end
  end
end
