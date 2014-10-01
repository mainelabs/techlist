require 'thor/rails'

class Import < Thor
  include Thor::Rails

  desc "places [FILE]", "Import places from a CSV file"
  def places(file)
    import = CsvImportService.new('Place', file, {state: 'active'})
    if import.valid?
      say 'Import started ...'
      import.save
      say "Finished. #{import.records.size} records imported."
    else
      error 'File is not valid and cannot be imported:'
      import.errors.full_messages.each do |message|
        error message
      end
    end
  end
end
