require 'rails_helper'

describe Resource do

  describe 'without_feedback' do
    it 'returns only resources w/ feedback' do
      resource_without = create(:resource)
      create(:resource, :with_feedback)

      expect(Resource.without_feedback).to match_array([resource_without])
    end
  end

end
