# Docomoru
Client library for DoCoMo API written in Ruby.

## Usage
Currenty docomoru is supporting [Dialogue API](https://dev.smt.docomo.ne.jp/?p=docs.api.page&api_docs_id=3).

```rb
client = Docomoru::Client.new(api_key: ENV["DOCOMO_API_KEY"])
response = client.create_dialogue("Gemつくりました")
response.status #=> 200
response.headers #=> {
  "Asyncserviceinvoke" => "false",
  "Content-Type"       => "application/json;charset=UTF-8",
  "Date"               => "Fri, 05 Dec 2014 15:10:11 GMT",
  "Content-Length"     => "165",
  "Connection"         => "Close"
}
response.body #=> {
  "utt"     => "gemに登録されるのでしょうかね",
  "yomi"    => "gemに登録されるのでしょうかね",
  "mode"    => "dialog",
  "da"      => "12",
  "context" => "dXIgT9u1_XKfO1QbaVkAGQ"
}
```
