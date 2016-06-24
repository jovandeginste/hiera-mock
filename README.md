[![Gem Version](https://badge.fury.io/rb/hiera-mock.svg)](https://badge.fury.io/rb/hiera-mock)

# hiera-mock

Hiera backend to return data from a single yaml file or random data (meant for testing purposes)

## Example

Content of `hiera.yaml`:

```yaml
:backends:
  - mock
:logger: console
#:hierarchy: # not relevant
:mock:
  :datafile: ./testdata.yaml
```

Content of `testdata.yaml`:

```yaml
---
mykey: abc

myhash:
  x: 5
  y: 3

myarray:
  - item1
  - item2
```

Results:

Strings:

```
$ hiera -c hiera.yaml mykey # from testfile.yaml
abc

$ hiera -c hiera.yaml mykeyX
7AgefRbP

$ hiera -c hiera.yaml mykeyX
YIuf6Bsycd
```

Arrays:

```
$ hiera -c hiera.yaml -a myarray # from testfile.yaml
["item1", "item2"]

$ hiera -c hiera.yaml -a mykeyX
["gpy21iJS",
 "mKsiUx",
 "R6dfyworj8hcWtJ",
 "LR4WlIEonA9",
 "ntAydF7HvDzb6oe",
 "A1VfWOK8xqmz",
 "KFsQPwbl8S"]

$ hiera -c hiera.yaml -a mykeyX
["Y5zJEPhaQNfq", "q0xoGB92", "1fGYMNVKRcQ", "qEMxOdCP"]
```

Hashes:

```
$ hiera -c hiera.yaml -h myhash # from testfile.yaml
{"x"=>5, "y"=>3}

$ hiera -c hiera.yaml -h mykeyX
{"kpO2jfdxZ"=>"lsjMGLSH", "XnR1xYKMt"=>"n3EoVzf", "LSYRzE"=>"mbbi2EsfIr"}

$ hiera -c hiera.yaml -h mykeyX
{"o2CxT65AgdsZae4"=>"KlQ0syH6wp",
 "wcleSzUvm04rDWbt"=>"oliWSqw",
 "6RxyELOVP"=>"xnS56K",
 "VsFjzMHT6aGqKl2J"=>"jJplAtfR80sC1vnD",
 "dbAW0XET"=>"B7Qw0HutgamVWS",
 "FnuXMNc4j8q"=>"bjCKBv",
 "R6qmupQiTGo37h"=>"Amyx6FDVltWC4"}
```
