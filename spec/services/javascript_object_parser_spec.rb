require 'rails_helper'

RSpec.describe JavascriptObjectParser, type: :service do
  context 'with a simple object' do
    let(:raw) do
      <<~DATA
        var pageData = {
          floor_plans: [
            {
              id: "1",
              name: "Loft"
            }
          ]
        }
      DATA
    end

    it do
      expect(described_class.new(raw).to_h).to include('floor_plans')
    end

    it do
      expect(described_class.new(raw).to_h).to be_a(Hash)
    end
  end

  context 'with a production stub object' do
    let(:raw) do
      file_fixture('script_data.txt').read
    end

    it do
      expect(described_class.new(raw).to_h).to be_a(Hash)
    end
  end

  context 'when the input contains extra lines with more declarations' do
    let(:raw) do
      <<~DATA
        let pageData = {
          floor_plans: [
            {
              id: "1",
              name: "Loft"
            }
          ]
        }

        var some_other_declaration
      DATA
    end

    it do
      expect { described_class.new(raw).to_h }.to raise_error(JavascriptObjectParser::UnclosedObjectError)
    end
  end
end
