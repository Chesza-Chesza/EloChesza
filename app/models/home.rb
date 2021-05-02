class Home < ApplicationRecord
  # def self.to_csv
  #   attributes = %w{id, email first_name}
  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes
      
  #     all.each do |user|
  #       csv << user.attributes.values_at(*attributes)
  #     end
  #   end
  # end

  def csv_file
    csv_str = CSV.generate do |csv|
      csv << ["awesome", "csv"]
    end
  
    IO.popen("secure-spreadsheet --password secret", "r+") do |io|
      io.write(csv_str)
      io.close_write
      io.read
    end
  end
  
  
end
