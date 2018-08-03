require 'rails_helper'

RSpec.describe CompletedTask, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
  it { should validate_presence_of(:room) }

end
