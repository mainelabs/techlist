require 'pathname'

class CsvImportService
  include ActiveModel::Model

  attr_reader :file

  def initialize(model_class, file, defaults = {})
    @model_class = model_class
    @file = full_path(file)
    @defaults = defaults
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

    begin
      CSV.new(File.read(@file), headers: :first_row, col_sep: ';', force_quotes: false).each do |row|
        records << model.new(row.to_hash.reverse_merge(@defaults))
      end
    rescue Exception => e
      errors.add(:csv_error, ": #{e.to_s}")
    end

    records
  end

  def file_exists?
    if !File.exists?(@file)
      errors.add(:file, "#{file} doesn't exist")
      return false
    end
    true
  end

  def records_all_valid?
    all_valid = true
    records.each_with_index do |record, i|
      if !record.valid?
        errors.add(:data_error, ": #{record.errors.full_messages.join(', ')} (line #{i + 2})")
        all_valid = false
      end
    end
    all_valid && errors.size == 0
  end
end
