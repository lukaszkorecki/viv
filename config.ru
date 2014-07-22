require 'json'
require 'time'

calc = Proc.new do
  (( Time.parse(Time.now.to_s) - Time.parse("2014-07-21") ) / (60 * 24 * 60)).round
end

payload = Proc.new do
  {
    "item" => [
      { "text" => "Number of days since Vivien's last coffee spill",
        "value" => calc.() }
    ]

  }
end

app = Proc.new do |env|
  [
    200,
    { "Content-Type" => "application/json" },
    [
      payload.().to_json
    ]
  ]
end

run app
