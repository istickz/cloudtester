require 'spec_helper'

describe "Questions" do
  describe "GET /questions" do
    it "works! (now write some real specs)" do
      get questions_path
      expect(response.status).to be(200)
    end
  end
end
