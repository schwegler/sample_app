require 'spec_helper'

describe ApplicationHelper do
  describe "full_title" do
    it "includes the page title" do
      expect(full_title("foo")).to match(/foo/)
    end

    it "includes the base title" do
      expect(full_title("foo")).to match(/^foo \| Media Inventory App$/)
    end

    it "does not include a bar for the home page" do
      expect(full_title("")).to match(/^Media Inventory App$/)
    end
  end
end
