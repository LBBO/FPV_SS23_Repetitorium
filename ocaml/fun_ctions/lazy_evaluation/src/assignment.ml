<<<<<<< HEAD
type 'a inf_list = Cons of 'a*(unit->'a inf_list)

let rec integers n = Cons(n, fun () -> integers @@ (n+1))

(*let nat_nb = integers 0
let (Cons(zero,_)) = 
let (Cons(one,_)) = l*)

let take n = 
  let rec take' n acc = function 
    |_ -> acc
    |Cons(a,xs) -> if n > 0 then take' (n-1) (a::[]) xs
    else acc
in take' n [] 

let rec take n (Cons(head,tail))= 
 if n > 0 then head:: (take (n-1) @@ tail ()) else []

let rec map f (Cons(head,tail)) = Cons((f head), fun () -> map f (tail ()))

let rec filter p (Cons(head,tail)) = 
  if p head then Cons(head, fun () -> filter p (tail ()))
  else filter p (tail ())

let rec filter p (Cons(head,tail)) = 
  let lazy_filtered_tail () = filter p @@ tail () in
    if p head then Cons(head, lazy_filtered_tail)
    else filter p @@ lazy_filtered_tail ()


type 'a lazy_value = unit -> 'a

let map_lazy f (a) = fun () -> f ( a ())

let bind_lazy bind a  = fun () -> bind (a())
let bind_lazy (bind: 'a -> 'b lazy_value) a  = (bind @@ a ()) ()

let combine_lazy l1 l2 = fun () -> (l1 (), l2 ())
=======
type 'a inf_list = Cons of 'a * (unit -> 'a inf_list)

let rec integers n = Cons (n, fun () -> integers (n + 1))
(* let natural_numbers = integers 0
   let (Cons (zero, natural_numbers_according_to_mathmaticians)) = natural_numbers
   let (Cons (one, _)) = natural_numbers_according_to_mathmaticians () *)

let rec take n (Cons (head, tail)) =
  if n > 0 then head :: (take (n - 1) @@ tail ()) else []

let rec map f (Cons (head, tail)) = Cons (f head, fun () -> map f (tail ()))

(* ⚠️ THIS NEVER TERMINATES ☠️ *)
(* let rec map f (Cons (head, tail)) =
   Cons
     ( f head,
       let new_tail = map f (tail ()) in
       fun () -> new_tail ) *)

let rec filter pred (Cons (head, tail)) =
  let lazy_filtered_tail () = filter pred @@ tail () in
  if pred head then Cons (head, lazy_filtered_tail)
  else filter pred @@ lazy_filtered_tail ()

type 'a lazy_value = unit -> 'a

(* let immediate_5 : int = 5
   let lazy_5 : int lazy_value = fun () -> 5 *)

let map_lazy f a () = f (a ())
let bind_lazy (bind : 'a -> 'b lazy_value) a () = (bind @@ a ()) ()
>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592
let combine_lazy l1 l2 () = (l1 (), l2 ())
