#encoding: utf-8
require File.expand_path 'app/spec/spec_helper'

# Remember to tag your tests!
# You can add multuple tags
describe "The Chicken app",:chickens do
# These are the things you do to setup you test.
# For example start the browser or gather data.
  before(:all) do
    capabilities = {
      'device' =>  "iPhone Simulator",
      'browserName' => 'iOS',
      'platform' => 'Mac',
      'version' => '7.0',
      # Hooray!
      'app' => "sauce-storage:CollViewSmpl.zip",
      :name => "iOS Appium Demo"
    }

    server_url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub"
    wd = Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)
    @browser = Watir::Browser.new wd
  end

  # Skip this for now
  # it 'has the correct webpage title' do
# 
    # @browser.element(:name, "Chicken Pics").click
    # @browser.element(:name, "Chicken Web").click
# 
    # # This doesn't seem to work well.  My app probably needs to do this better anyway.
    # #b.element(:xpath, "//window[1]/scrollview[1]/webview[1]").wait_until_present
    # sleep 20
# 
    # @browser.windows[0].use
# 
    # expect(@browser.title).to eq("Things")
# 
    # # Back to interacting natively
    # @browser.execute_script("mobile: leaveWebView")
  # end

  it "has the correct button name" do
    @browser.element(:name, "Chicken Calculator").click
    # Get the text of the button
    expect(@browser.element(:xpath, "//window[1]/button[1]").attribute_value("name")).to eq("Calculate")
  end

  it "can calculate the number of chickens" do
  # Run a calculation
    @browser.element(:xpath, "//window[1]/textfield[1]").when_present.send_keys "1"
    @browser.element(:xpath, "//window[1]/textfield[2]").send_keys "2"
    @browser.element(:name, "Calculate").click

    # Get the resulting value
    expect(b.element(:xpath, "//window[1]/text[2]").text).to eq("4")
  end

  # Cleanup
  # For example, logout and other such cleanup activities.
  after(:all) do
    @browser.close rescue nil
  end
end
