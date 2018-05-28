# Reason for Native Linux apps

This is my setup for writing linux native apps, using ReasonML syntax instead of OCaml. I did this on my workstation, which has bs-platform and reason-cli installed globally, for front-end dev, so far I've had no collisions.

Install OCaml and the other stuff

```
sudo apt-get install ocaml-native-compilers camlp4-extra ocaml opam
```

I ran these opam setup commands from ~/. These are used for editor integration as well.

```
opam init
opam update
opam install reason
opam install merlin
opam install re
opam install ocp-indent
```

Then make a couple of bash scripts for switching between Reason and OCaml

Put these aliases into your ~/.bashrc or ~/.zshrc

```
# formats ugly ocaml into pretty ocaml, one file to another
# usage: `formatocaml test.min.ml test.ml`
# tried to read and re-write in one file, but it fails
alias formatocaml='f(){ camlp4 "$1" -parser o -printer o > "$2"; unset -f f; }; f'

# converts reason code into ocaml
# usage: `reml test test.re` => pretty test.ml (intermediary file test.min.ml gets deleted)
alias reml='f(){ echo `cat "$2" | refmt --parse re --print ml --interface false` > "$1".min.ml && camlp4 "$1".min.ml -parser o -printer o > "$1".ml && rm "$1".min.ml;  unset -f f; }; f'

# converts ocaml code into reason
# usage: `mlre test test.ml` => ugly test.re (I have format on save)
alias mlre='f(){ echo `cat "$2" | refmt --parse ml --print re --interface false` > "$1".re ;  unset -f f; }; f'
```

Then run ```source ~/.zshrc``` or your own config file.

These three functions I wrote, mostly lifted from the reason docs, are useful in development.

```
reml [app name] [source file]
mlre [app name] [source file]
formatocaml [input.ml file] [output.ml file]
```

### Steps for development

- Write a .re file
- Run it through the reml function ```reml test test.re```
- This produces test.ml
- Make an executable from test.ml ```opcamlopt -o app test.ml```
- Run your app with ```./app```


My app in particular takes an integer argument ```./app 14```.
