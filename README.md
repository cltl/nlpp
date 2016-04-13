NLPP
====

Install the latest English/Dutch bi-lingual  [Newsreader](http://www.newsreader-project.eu) pipeline on a decent Linux computer.

When possible, the installer obtains the modules directly from repo's
like Github. Otherwise, it downloads them from a closed snapshot archive. To get modules
from the snapshot it is necessary to obtain an SSH key (Contact me). 

Currently the installer has only been tested on Ubuntu or Centos Linux.


## Installation

Installation goes as follows:

1. cd to the top-directory where you want the pipeline to be installed.
2. Put the private key "nrkey" in this directory
3. If applicable, put a script "local.m4" in it.
4. Clone this repository.
5. cd to subdirectory `nlpp/nuweb`
6. perform `make install`



## Test and run

To test the English or the Dutch pipeline, perform `make test en`
resp. `make test nl`. When all went well, at the end there is a
directory `nlpp/test` that contains a valid annotated NAF file `out.naf`.

To annotate a "raw" NAF-encoded document, feed it through
`nlpp/bin/nlpp`, e.g.

```
$ cat raw.naf | nlpp/bin/nlpp >annotated.naf
```

It might be a good idea to copy `nlpp/bin/nllpp` to a directory that
is mentioned in your `PATH` variable.



## Documentation

The installer is made with the nuweb Literate Programming tool. This
tool generates a PDF file with the documented code and with further
documentation. The PDF can be found as `nuweb/nlpp.pdf`

