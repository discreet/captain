require 'input'

describe Input do
  describe ".getDir" do
    it 'returns directory as input' do
      allow($stdin).to receive(:gets).and_return("directory\n")
      name = $stdin.gets
      name = name.chomp

      expect(name).to eq('directory')
    end
  end
end
