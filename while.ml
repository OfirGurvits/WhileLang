type num = Int
type var = string
(* supposed to hold all of the variables, not bound by 20*)
let variables = Hashtbl.create 20;;

(*defines types of arithmetic expressions*)
type a_expr =
| Plus of a_expr * a_expr        
| Minus of a_expr * a_expr
| Mul of a_expr * a_expr
| Var of var 
| Num of int

(*defines types of boolean expressions*)
type b_exp =
| true
| false
| Not of b_exp
| And of b_exp * b_exp
| Equal of a_expr * a_expr
| GreaterThan of a_expr * a_expr

(*defines possible commands*)
type stm = 
| Assign of var * a_expr
| Skip
| EndLine of stm * stm
| If of b_exp * stm * stm
| While of b_exp * stm

(*evaluates an arithmetic expression down to a number*)
let rec eval_arithmetic = function
| Plus(x,y) -> eval_arithmetic x + eval_arithmetic y
| Minus(x,y) -> eval_arithmetic x - eval_arithmetic y
| Mul(x,y) -> eval_arithmetic x * eval_arithmetic y
| Var(x) -> Hashtbl.find variables x
| Num(n) -> n