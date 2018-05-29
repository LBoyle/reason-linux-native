# Reason for Native Linux apps

**Warning**

This is my setup for writing linux native apps, using ReasonML syntax instead of OCaml. I did this on my workstation, which has bs-platform and reason-cli installed globally, for front-end dev. 

**It did cause collisions and broke the front-end setup.**

I'm yet to try containerising or compartmentalising in some way. 

I absolutely need to do both things on one machine, any less is unacceptable. 

***

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

Note: You'll want to use the same name for your input .re and output .native, rebuild doesn't like it otherwise.

### Steps for development

- Write a .re file
- Run it through the build function ```rebuild test.native -pp refmt test.re```
- Execute ```./test.native```


My app in particular takes an integer argument ```./test.native 14```.
