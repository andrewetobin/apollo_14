require 'rails_helper'

describe 'astronaut index page' do
  it "user sees list of astronauts" do
    astronaut = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")

    visit '/astronauts'

    expect(page).to have_content("Name: #{astronaut.name}")
    expect(page).to have_content("Age: #{astronaut.age}")
    expect(page).to have_content("Job: #{astronaut.job}")
  end
  it "sees_average_age_of_all_astronauts" do
    astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
    astronaut_2 = Astronaut.create(name: "Jeff Coffin", age: 42, job: "Flying")

    visit '/astronauts'

    expect(page).to have_content("Average Age: #{Astronaut.average_age}")
  end
end
