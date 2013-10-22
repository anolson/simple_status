require 'spec_helper'

feature "Status dashboard" do
  given(:current_status) { Status.create(current: true, state: "up", last_updated: Time.current) }

  background do
    Message.create(body: "All systems go!", status_id: current_status.id)
    Message.create(body: "Oops!?", status_id: current_status.id )
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