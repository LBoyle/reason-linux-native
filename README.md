# Reason for Native Linux apps

**Warning**

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
Use this command to build an executable

```
rebuild [main.native] -pp refmt [main.re]
```

### Steps for development

- Write a .re file
- Run it through the build function ```rebuild app.native -pp refmt test.re```
- Execute ```./app.native```


My app in particular takes an integer argument ```./app.native 14```.
