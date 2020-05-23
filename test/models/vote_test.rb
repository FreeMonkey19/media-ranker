require "test_helper"


describe Vote do
  before do
    @work = works(:album1)
    @user = users(:user1)
    @vote = votes(:vote1)
  end

  it "it is valid when all fields are present" do
    expect(@vote.valid?).must_equal true
  end

  
  it "will have the required fields" do
    [:work_id, :user_id].each do |field|
      expect(@vote).must_respond_to field
    end
  end

  describe "validations" do
    before do
      @user1 = users(:user1)

      @new_vote = Vote.new(
        user_id: @user1.id,
        work_id: @work.id
      )
    end
    
  end

   
  
end # ending describe block
