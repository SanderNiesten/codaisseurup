require "rails_helper"

describe "Viewing an individual event" do

  let(:event) {create :event}

  it "It shows the users event details" do
    visit event_url(event)

    expect(page).to have_text (event.name)
    expect(page).to have_text (event.description)
    expect(page).to have_text (event.location)
    expect(page).to have_text (event.price)
  end
end
