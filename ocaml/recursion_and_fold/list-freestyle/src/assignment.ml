(*BST 10 Mins.*)
type bst = Leaf | Node of bst * int * bst

val insert : int -> bst -> bst
val contains : int -> bst -> bool
val delete : int -> bst -> bst
val height : bst -> int
val inorder : bst -> int list
val preorder : bst -> int list
val postorder : bst -> int list
val mirror : bst -> bst

val length : bst -> int
val sum : bst -> int
val prod : bst -> int
val map : (int -> int) -> bst -> bst
val fold_left : ('a -> int -> 'a) -> 'a -> bst -> 'a
val filter : (int -> bool) -> bst -> bst
val partition : (int -> bool) -> bst -> bst * bst

(*List 10 Mins.*)
val length : 'a list -> int
val sum_int : int list -> int
val sum_float : float list -> float
val prod_int : int list -> int
val map : ('a -> 'b) -> 'a list -> 'b list
val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a
val filter : ('a -> bool) -> 'a list -> 'a list
val partition : ('a -> bool) -> 'a list -> 'a list * 'a list

(*Lazy 10 Mins.*)
type 'a inf_list = Cons of 'a*(unit->'a inf_list)
let integers n =
let take n = 
let filter =

type 'a lazy_value = unit -> 'a
let map_lazy 
let bind_lazy
let combine_lazy 