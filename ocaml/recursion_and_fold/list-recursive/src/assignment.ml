<<<<<<< HEAD
let length _ = failwith "TODO"
let sum_int _ = failwith "TODO"
let sum_float _ = failwith "TODO"
let prod_int _ = failwith "TODO"
let map _ _ = failwith "TODO"
let fold_left _ _ _ = failwith "TODO"
let filter _ _ = failwith "TODO"
let partition _ _ = failwith "TODO"

(*tail-recursive*)

let rec length = function [] -> 0 | _ :: xs -> 1 + length xs
let length list = let rec length' acc = function [] -> acc | _::xs -> length' (acc+1) xs in length' 0 list

let rec sum_int = function [] -> 0 | x :: xs -> x + length xs
let sum_int = let rec sum_int' acc = function [] -> acc | x::xs -> sum_int' (acc+x) xs in sum_int' 0

let rec sum_float = function [] -> 0. | x :: xs -> x +. sum_float xs
let sum_float = let rec sum_float' acc = function [] -> acc | x :: xs -> sum_float' (acc+.x) xs in sum_float' 0.

let rec prod_int = function [] -> 1 | x :: xs -> x * prod_int xs
let prod_int = let rec prod_int' acc = function [] -> acc | x :: xs -> prod_int' (acc*x) xs in prod_int' 1

let rec map f = function [] -> [] | x :: xs -> f x :: map f xs
let map f l = let rec map' f acc = function [] -> List.rev acc | x :: xs -> map' f ((f x)::acc) xs in map' f [] l
(*map f l ?*)

let rec fold_left f acc = function
  | [] -> acc
  | x :: xs -> fold_left f (f acc x) xs
let rec fold_left f acc = function
  | [] -> acc
  | x :: xs -> fold_left f (f acc x) xs

let rec filter pred = function
  | [] -> []
  | x :: xs when pred x -> x :: filter pred xs
  | _ :: xs -> filter pred xs
let filter pred l = 
  let rec filter' pred acc = function
  | [] -> List.rev acc
  | x :: xs when pred x -> filter' pred (x::acc) xs
  | _ :: xs -> filter' pred acc xs
in filter' pred [] l

let rec partition p = function
  | [] -> ([], [])
  | x :: xs ->
      let yes, no = partition p xs in
      if p x then (x :: yes, no) else (yes, x :: no)
let partition p = 
  let rec partition' p acc1 acc2 = function
  | [] -> (List.rev acc1, List.rev acc2)
  | x :: xs -> if p x then partition' p (x::acc1) acc2 xs else partition' p acc1 (x::acc2) xs
  in partition' p [] [] 
let partition p = 
    let rec partition' p acc1 acc2 = function
    | [] -> (List.rev acc1, List.rev acc2)
    | x::xs when p x -> partition' p (x::acc1) acc2 xs 
    | x::xs -> partition' p acc1 (x::acc2) xs
    in partition' p [] [] 

=======
let rec length = function [] -> 0 | _ :: xs -> 1 + length xs
let rec sum_int = function [] -> 0 | x :: xs -> x + sum_int xs
let rec sum_float = function [] -> 0. | x :: xs -> x +. sum_float xs
let rec prod_int = function [] -> 1 | x :: xs -> x * prod_int xs
let rec map f = function [] -> [] | x :: xs -> f x :: map f xs

let rec fold_left f acc l =
  match l with [] -> acc | x :: xs -> fold_left f (f acc x) xs

let rec filter predicate = function
  | [] -> []
  | x :: xs when predicate x -> x :: filter predicate xs
  | _ :: xs -> filter predicate xs

let rec filter predicate = function
  | [] -> []
  | x :: xs -> (if predicate x then [ x ] else []) @ filter predicate xs

let rec partition pred = function
  | [] -> ([], [])
  | x :: xs ->
      let l1, l2 = partition pred xs in
      if pred x then (x :: l1, l2) else (l1, x :: l2)
>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592
