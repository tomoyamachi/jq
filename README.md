# jq
Dockerize [jq](https://github.com/stedolan/jq) latest stable version

The image size under 4MB.


## from string

```shell script
$ docker run --rm tomoyamachi/jq -nC --argjson j '{"key":"value"}' '$j | .'    

{
  "key": "value"
}
```

## from files

We can parse a local file.

````
$ echo '{"key":"value"}' > test.json
$ docker run --rm -v $(pwd)/test.json:/file tomoyamachi/jq -C '.' /file

{
  "key": "value"
}
```

