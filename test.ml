let rec fib x =
  match x with | 0 -> 1 | 1 -> 1 | n -> (fib (x - 1)) + (fib (x - 2))
  
let _ =
  if (Array.length Sys.argv) > 1
  then
    (let argument = Sys.argv.(1) in
     let result = fib (int_of_string argument)
     in
       (print_string "Running reason >> ocaml >> native linux";
        print_newline ();
        print_string ("Fib of " ^ (argument ^ " is "));
        print_int result;
        print_newline ()))
  else
    (print_string "Enter an integer value for an argument";
     print_newline ();
     print_string "e.g. `$ ./target 14`";
     print_newline ())
  

