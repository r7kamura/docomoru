# Docomoru
Client library for DoCoMo API written in Ruby.

## Install
Note: requires Ruby 2.0.0 or higher.

```sh
gem install docomoru
```

## Library
Currenty docomoru is supporting [Dialogue API](https://dev.smt.docomo.ne.jp/?p=docs.api.page&api_docs_id=3)
(You need DoCoMo API Key).

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

## CLI
`docomoru` executable is bundled to call use Docomoru from CLI.

```
$ docomoru <method> <arguments> [options]
              |          |          |
              |          |          `-- -a, --api-key (or use DOCOMO_API_KEY env)
              |          |              -h, --help
              |          |                  --header
              |          |                  --no-body
              |          |
              |          `------------------------------ required arguments for the method
              |
              `----------------------------------------- method name

$ docomoru create_dialogue Gemになってみた感想はどうですか
```

![](images/cli.png)
