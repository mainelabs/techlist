require 'rails_helper'

describe CsvImportService do
  describe '#valid?' do
    it 'returns true if all the records are valid' do
      importer = CsvImportService.new('Place', Rails.root.join('spec/fixtures/csv/valid.csv'))

      expect(importer.valid?).to be_true
    end

    it "returns false if file doesn't exists" do
      importer = CsvImportService.new('Place', '/missing.csv')

      expect(importer.valid?).to be_false
      expect(importer.errors.full_messages.first).to eq("File /missing.csv doesn't exist")
    end

    it 'returns false if one record is not valid' do
      importer = CsvImportService.new('Place', Rails.root.join('spec/fixtures/csv/not_valid.csv'))

      expect(importer.valid?).to be_false
      expect(importer.errors.full_messages.first).to eq("Data error : Name can't be blank (line 2)")
    end
  end

  describe '#save' do
    it 'creates the records' do
      importer = CsvImportService.new('Place', Rails.root.join('spec/fixtures/csv/valid.csv'))

      importer.save

      expect(Place.count).to eq(1)
    end

    it 'force default values' do
      importer = CsvImportService.new('Place', Rails.root.join('spec/fixtures/csv/valid.csv'), state: 'active')

      importer.save

      expect(Place.first.state).to eq('active')
    end
  end

  describe '#file' do
    it 'returns the given path if absolute' do
      importer = CsvImportService.new('Place', '/somewhere.csv')

      expect(importer.file).to eq('/somewhere.csv')
    end

    it 'returns a full path if relative' do
      importer = CsvImportService.new('Place', 'somewhere.csv')

      expect(importer.file).to eq("#{Dir.pwd}/somewhere.csv")
    end
  end
end
