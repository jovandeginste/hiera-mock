[![Gem Version](https://badge.fury.io/rb/hiera-mock.svg)](https://badge.fury.io/rb/hiera-mock)

# hiera-mock

Hiera backend to return data from a single yaml file or random data (meant for testing purposes)

## Example

Content of `hiera.yaml` and `testdata.yaml` are in `./example`

Results:

Strings:

```
$ hiera -c hiera.yaml mykey
abc

$ hiera -c hiera.yaml mykeyX
mocked-6IpG7AS502qmg9W

$ hiera -c hiera.yaml mykeyX
mocked-Ur3jfD9As5cgYV8W
```

Arrays:

```
$ hiera -a -c hiera.yaml myarray
["item1", "item2"]

$ hiera -a -c hiera.yaml myarrayX
["mocked-l07OFvt29ciL",
 "mocked-hKE3ftukpFjQUl",
 "mocked-f2h7ncm80GFS",
 "mocked-HJukQsfdA",
 "mocked-lKxP9Csy5jku",
 "mocked-9FkhtVzSNPDHn",
 "mocked-XO0ijv9kbJG"]

$ hiera -a -c hiera.yaml myarrayX
["mocked-rZAM01", "mocked-wu1SV5TNjaKepmX7", "mocked-zn2qSOGxQBvb"]
```

Hashes:

```
$ hiera -h -c hiera.yaml myhash
{"x"=>5, "y"=>3}

$ hiera -h -c hiera.yaml myhashX
{"mocked-G5iNB2"=>"mocked-8SLDn1ZJO",
 "mocked-l1JcezPomdUgZWvR"=>"mocked-TC1rJbmpf8agD0l",
 "mocked-qDdQhL7MmSU"=>"mocked-N9BiqI",
 "mocked-tV7k2JFCmLrYqQ"=>"mocked-5aBrK6",
 "mocked-A4aQdgk81Cs"=>"mocked-3lnPzZ"}

$ hiera -h -c hiera.yaml myhashX
{"mocked-ToJXAv5"=>"mocked-Z6Jt7Wbydao",
 "mocked-KkYo3TIy26"=>"mocked-5UgtjJ8MZ6mLfn",
 "mocked-eK5nR8s1CP6y4MV"=>"mocked-XD3x1GEK",
 "mocked-TRvgZjsSJ7WGdnHB"=>"mocked-meSNKLVxtsYo",
 "mocked-fONpret"=>"mocked-gyOmbIzXEdVlAfS",
 "mocked-PqQi9BUm2bv"=>"mocked-pxhn5kV9RoE"}
```

Nil:

```
$ hiera -c hiera.yaml mynil
nil

$ hiera -c hiera.yaml -a mynil
nil

$ hiera -c hiera.yaml -h mynil
nil

$ hiera -c hiera.yaml mynilX
mocked-40G8krjTNseao
```

Returning `nil` will first go to the next hiera layer, and finally (if nothing else returns _something_) make the hiera function use the default value. If no default was defined in the function call, it will throw an error. Using `~` in `hiera-mock` will make such situations visible.
