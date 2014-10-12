class Kind
  ALL = ['school', 'lab', 'company', 'media', 'accelerator', 'incubator', 'coworking', 'nonprofit', 'cluster']

  def self.codes
    ALL
  end

  def self.all
    codes.map { |code| { id: code, name: I18n.t("kinds.codes.#{code}") } }
  end
end
