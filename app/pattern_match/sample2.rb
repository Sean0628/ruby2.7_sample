require 'json'

json =  File.read('/app/pattern_match/test_data.json')

case JSON.parse(json, symbolize_names: true)
in { name: 'Alice', children: [{ name: 'Bob', age: age }]}
  p age
end
