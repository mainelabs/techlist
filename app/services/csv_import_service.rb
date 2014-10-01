require 'pathname'

class CsvImportService
  include ActiveModel::Model

  attr_reader :file

  def initialize(model_class, file)
    @model_class = model_class
    @file = full_path(file)
  end

  def valid?
    @valid ||= file_exists? && records_all_valid?
  end

  def save
    records.map(&:save) if valid?
  end

  private

  def model
    @model_class.constantize
  end

  def records
    @records ||= read_from_csv
  end

  def full_path(path)
    if (Pathname.new path).absolute?
      return path
    end
    "#{Dir.pwd}/#{path}"
  end

  def read_from_csv
    records = []
    CSV.new(File.read(@file), headers: :first_row, col_sep: ';', force_quotes: false).each do |row|
      records << model.new(row.to_hash)
    end
    records
  end

  def file_exists?
    if !File.exists?(@file)
      errors.add(:file, "doesn't exists")
      return false
    end
    true
  end

  def records_all_valid?
    all_valid = true
    records.each_with_index do |record, i|
      if !record.valid?
        errors.add("line_#{i + 2}", ": #{record.errors.full_messages.join(', ')}")
        all_valid = false
      end
    end
    all_valid
  end
end
