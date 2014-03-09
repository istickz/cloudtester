require 'spec_helper'

describe ExamController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      expect(response).to be_success
    end
  end

  describe "GET 'check'" do
    it "returns http success" do
      get 'check'
      expect(response).to be_success
    end
  end

end
