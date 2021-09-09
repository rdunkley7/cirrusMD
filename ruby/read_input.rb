class ReadInput
  require 'csv'

  def initialize
    if File.exist?("input.csv")
      read_csv
    end
  end



end
