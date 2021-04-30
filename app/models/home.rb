class Home < ApplicationRecord
  def self.to_csv
    attributes = %w{id, email first_name}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end
end
