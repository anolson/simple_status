require 'spec_helper'

feature "Status dashboard" do
  background do
    CurrentStatus.create(status: "up", last_updated: Time.current)

    Message.create(body: "All systems go!")
    Message.create(body: "Oops!?")
  end

  scenario "displays the current system status." do
    visit root_path

    page.should have_content("All systems go!")
  end

  scenario "displays a history of older status messages." do
    visit root_path

    page.should have_content("All systems go!")
    page.should have_content("Oops!?")
  end
end