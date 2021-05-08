File.readlines(File.join(Rails.root, 'db', 'seeds', 'players_filtered.txt' )).each_with_index do |line, index|
  if index > 0
    fide_number = line[0..14].strip
    next if Player.find_by(fide_number: fide_number).present?

    full_name = line[15..75].strip
    last_name, first_name = full_name.split(', ')
    gender = line[79..82].strip.downcase == 'f' ? 0 : 1
    
    plyr = Player.create(fide_number: fide_number, 
                  title: line[83..88].strip.downcase, 
                  first_name: first_name,
                  last_name: last_name,
                  fed: line[76..78].strip, 
                  gender: gender, 
                  b_day: line[152..157].strip, 
                  elo: line[113..118].strip, 
                  ranked_opponents: line[119..122].strip, 
                  k_value: line[134..138].strip, 
                  last_elo_update: '2021-04-26')
    puts "#{plyr.first_name} #{plyr.first_name}: #{plyr.fide_number}"
  end
end

# wtit = line[89..93].strip
# otit = line[94..107].strip
# foa = line[108..112].strip
# sk = line[123..125].strip
# rrtng = line[126..131].strip
# rgm = line[126..131].strip
# brtng = line[139..142].strip
# bgm = line[143..147].strip
# bk = line[148..151].strip
# flag = line[158..161].strip