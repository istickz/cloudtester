require 'spec_helper'

describe "Tests" do
  describe "GET /tests" do
    it "works! (now write some real specs)" do
      get tests_path
      expect(response.status).to be(200)
    end
  end
end
