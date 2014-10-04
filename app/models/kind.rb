class Kind
  ALL = ['school', 'lab', 'company', 'media', 'accelerator', 'incubator', 'coworking', 'investor', 'nonprofit', 'cluster']

  def self.codes
    ALL
  end

  def self.all
    kinds = []
    codes.each do |code|
      kinds << { code: code, name: code.humanize }
    end
    kinds
  end
end
