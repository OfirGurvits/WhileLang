type num = Int

type var = string

type a_expr =
  | Plus of a_expr * a_expr        
  | Minus of a_expr * a_expr
  | Times of a_expr * a_expr
  | Var of var 
  | Num of num

type b_exp =
  | true
  | false
  | Not of b_exp
  | And of b_exp * b_exp
  | Equal of a_expr * a_expr
  | GreaterThan of a_expr * a_expr

type stm = 
  | Assign of var * a_expr
  | Skip
  | EndLine of stm * stm
  | If of b_exp * stm * stm
  | While of b_exp * stm
  