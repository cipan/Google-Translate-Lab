require 'csv'
require 'rubygems'
require 'easy_translate'

csv_text = File.read('Chinese.csv')
## Uncomment and Comment out above line for judging phrase correctness. (Requires large amount of user input)
# csv_text = File.read('ChineseSentences.csv')
csv = CSV.parse(csv_text, :headers => true)
$correctmatch = 0
$totalmatch = 0

EasyTranslate.api_key = 'AIzaSyD7GqRdQxks6AoqkFCX_a7B0hk_PDTcM8c'

csv.each do |row|                                      
query = row['Chinese Word']
query = query.gsub(/\s+/, "")
result = EasyTranslate.translate(query, :from => 'zh-CN', :to => :en) 

exResult = row['in English']

# puts result
# puts exResult.eql?(result)
  
if exResult.eql?(result)
  $correctmatch += 1
else
  puts query+" -> "+result+" != "+exResult
  
end
  
  $totalmatch += 1
end
  
  puts $correctmatch