require 'json'
require 'time'

calc = Proc.new do
  (( Time.parse(Time.now.to_s) - Time.parse("2014-08-06") ) / (60 * 24 * 60))
end

payload = Proc.new do
  {
    "item" => [
      { "text" => "Number of days since Vivien's last spill",
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
