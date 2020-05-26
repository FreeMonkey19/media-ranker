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

  it "has two required fields" do
    [:work_id, :user_id].each do |field|
      expect(@vote).must_respond_to field
    end
  end

  describe "custom method" do
    describe "tally_votes" do

      it "tallys votes of specific Work " do
        album2 = works(:album2)
        expect(Vote.tally_votes(album2.id)).must_equal 3
      end
    end
  end
end # ending describe block
