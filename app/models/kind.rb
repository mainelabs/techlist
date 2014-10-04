class Kind
  ALL = ['school', 'lab', 'company', 'media', 'accelerator', 'incubator', 'coworking', 'investor', 'nonprofit', 'cluster']

  def self.codes
    ALL
  end

  def self.all
    codes.map { |code| { id: code, name: code.humanize } }
  end
end
