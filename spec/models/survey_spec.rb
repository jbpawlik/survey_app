require 'rails_helper'

describe Survey do
  it { should have_many(:questions) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :topic }
  it { should validate_length_of(:name).is_at_most(100) }
  it("titleizes the name of a Survey") do
    survey = Survey.create({name: "rabbit questions", topic:"You guessed it: questions about rabbits."})
    expect(survey.name()).to(eq("Rabbit Questions"))
  end
end