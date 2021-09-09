class ReadInput
  require 'csv'
  require 'date'

  def initialize
    if File.exist?("input.csv")
      read_csv
    end
  end

  def read_csv
    valid_data = []
    invalid_data = []
    data = CSV.parse(File.read("./input.csv"), headers: true, header_converters: :symbol, converters: [:integer, :date])
    data.each do |patient|
      first_name = patient[:first_name]
      last_name = patient[:last_name]
      patient[:dob] =  validate_date(patient[:dob].to_s)
      member_id = patient[:member_id]
      patient[:effective_date] = patient[:effective_date]
      patient[:expiry_date] = patient[:expiry_date]
      patient[:phone_number] = validate_phone(patient[:phone_number].to_s)


       if patient[:first_name].nil? || patient[:last_name].nil? || patient[:dob].nil? || patient[:member_id].nil? || patient[:effective_date].nil?
        invalid_data.push(patient)
      else
        valid_data.push(patient)
      end
    end
    #output_csv(valid_data, invalid_data)
  end


   def validate_date(date)
    begin
      date = Date.strptime(date).strftime("%Y-%m-%d")
      return date
    rescue
      return nil
    end
   end

  def validate_phone(number)
    return number.gsub(/\A(\+)|\D+/, '\1')
  end

  def output_csv(valid_data, invalid_data)
    CSV.open("output.csv", "w", write_headers: true, headers: %w[first_name last_name dob member_id effective_date expiry_date phone_number] ) do |csv|
      csv << valid_data
    end

    File.open('report.txt', 'a') do |f|
      f.puts "This report contains all patients with either invalid or missing."
      f.puts "Unfortunately #{invalid_data.count} patients had an invalid data."
    end
    invalid_data.each do |patient|
      File.open('report.txt', 'a') do |f|
        f.puts "----"
        f.puts patient
      end
    end
  end
end
