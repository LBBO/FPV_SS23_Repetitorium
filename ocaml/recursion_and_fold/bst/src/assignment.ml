type bst = Leaf | Node of bst * int * bst

<<<<<<< HEAD
let rec insert n tree = match tree with
  |Leaf -> Leaf
  |Node(l,v,r) -> if v > n then Node(insert n l, v, r)
  else if v < n then Node(l, v, insert n r)
  else tree

let rec contains n tree = match tree with 
  |Leaf -> false 
  |Node(l,v,r) -> if v > n then contains n l
  else if v < n then contains n r
  else true

let rec get_max tree = match tree with
  |Leaf -> Leaf
  |Node(Leaf,v,r) -> Node(Leaf,v,get_max r)
  |_,Leaf -> l
  |_,_ -> r 

let rec delete n tree = match tree with
  |Leaf -> Leaf
  |Node(l,v,r) -> if v > n then Node(delete n l, v, r)
  else if v < n then Node(l, v, delete n r)
  else Node()

let rec height tree = match tree with
|Leaf -> 0
|Node(l,v,r) -> 1 + height l + height r

let rec inorder tree = match tree with
  |Leaf -> []
  |Node(Leaf,v,r) -> v::inorder r
  |Node(l,v,Leaf) -> inorder l@[v]
  |Node(l,v,r) -> (inorder l)@[v]@(inorder r)

let rec preorder tree = match tree with
  |Leaf -> []
  |Node(Leaf,v,r) -> [v]@(inorder r)
  |Node(l,v,Leaf) -> [v]@(preorder l)
  |Node(l,v,r) -> [v]@(inorder l)@(inorder r)

let rec postorder tree = match tree with
  |Leaf -> []
  |Node(Leaf,v,r) -> (inorder r)@[v]
  |Node(l,v,Leaf) -> (preorder l)@[v]
  |Node(l,v,r) -> (inorder l)@(inorder r)@[v]

let rec mirror tree = match tree with
  |Leaf -> Leaf 
  |Node(l,v,r) -> Node(mirror r, v, mirror l)

let rec length = function
let rec sum = function
let rec prod = function
let rec map f = function
let rec fold_left f acc tree = failwith "TODO"
let filter _ _ = failwith "TODO"
let partition _ _ = failwith "TODO"


(*_________________________________________________________________*)
type bst = Leaf | Node of bst * int * bst

let rec insert n tree =
  match tree with
  | Leaf -> Node (Leaf, n, Leaf)
  | Node (l, v, r) ->
      if n < v then Node (insert n l, v, r)
      else if n = v then tree
      else Node (l, v, insert n r)
(*not yet tail-recursive*)
let insert2 n tree =
  let rec insert' n tree acc =
  match tree with
  | Leaf -> acc
  | Node (l, v, r) -> 
      let left_acc = if v > n  then insert' n l acc else acc in 
      let right_acc = if v < n then insert' n r right_acc else right_acc in
      insert' n r 
in insert' n tree (Node(Leaf,n,Leaf))

let rec contains n = function
  | Leaf -> false
  | Node (l, v, r) ->
      if n = v then true else if v > n then contains n l else contains n r
(*already tail-recursive*)
let rec contains n = function
  | Leaf -> false
  | Node (l, v, r) ->
      if n = v then true else if v > n then contains n l else contains n r

let rec get_max = function
  | Leaf -> failwith "Leaf has no max"
  | Node (_, v, r) -> if r = Leaf then v else get_max r
(*already tail-recursive*)
let rec get_max = function
  | Leaf -> failwith "Leaf has no max"
  | Node (_, v, r) -> if r = Leaf then v else get_max r

let rec delete n = function
=======
let rec insert n t =
  match t with
  | Leaf -> Node (Leaf, n, Leaf)
  | Node (l, v, r) as node ->
      if n > v then Node (l, v, insert n r)
      else if n < v then Node (insert n l, v, r)
      else node

let rec contains n t =
  match t with
  | Leaf -> false
  | Node (l, v, r) ->
      if n > v then contains n r else if n < v then contains n l else true

let rec delete_max t =
  match t with
  (* return (t, max) *)
  | Leaf -> failwith "shouldn't be possible"
  | Node (l, v, Leaf) -> (l, v)
  | Node (l, v, r) ->
      let new_r, max = delete_max r in
      (Node (l, v, new_r), max)

let rec delete n t =
  match t with
>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592
  | Leaf -> Leaf
  | Node (l, v, r) ->
      if n < v then Node (delete n l, v, r)
      else if n > v then Node (l, v, delete n r)
      else if l = Leaf then r
<<<<<<< HEAD
      else
        let new_v = get_max l in
        Node (delete new_v l, new_v, r)
(*TO-DO*)
let rec delete n = function
  | Leaf -> Leaf
  | Node (l, v, r) ->
      if n < v then Node (delete n l, v, r)
      else if n > v then Node (l, v, delete n r)
      else if l = Leaf then r
      else
        let new_v = get_max l in
        Node (delete new_v l, new_v, r)
=======
      else if r = Leaf then l
      else
        let new_l, max = delete_max l in
        Node (new_l, max, r)
>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592

let rec height = function
  | Leaf -> 0
  | Node (l, _, r) -> 1 + Int.max (height l) (height r)
<<<<<<< HEAD
(*adjusted tail-recursive*)
let height2 = 
  let rec height' acc = function
  | Leaf -> acc
  | Node (l, _, r) -> 
    let v_acc = acc + 1 in 
    let left_acc = height' v_acc l in 
    let right_acc = height' v_acc r in
    if left_acc > right_acc then left_acc else right_acc
in height' 0

let rec inorder = function
  | Leaf -> []
  | Node (l, v, r) -> inorder l @ [ v ] @ inorder r
(*TO-DO*)
let inorder2 tree = 
    let rec helper acc todo tree =
    match tree with 
    | Leaf -> (match todo with
              |[] -> acc
              |node::todo -> helper acc todo node)
    | Node (l, v, r) -> helper (v::acc) (l::todo) r
    in helper [] [] tree 

let rec preorder = function
  | Leaf -> []
  | Node (l, v, r) -> [ v ] @ preorder l @ preorder r
(*TO-DO*)
let preorder2 tree = 
  let rec helper acc todo tree =
  match tree with 
  | Leaf -> (match todo with
            |[] -> acc
            |node::todo -> helper acc todo node)
  | Node (l, v, r) -> helper (v::acc) (l::todo) r
  in helper [] [] tree 
=======

let rec inorder = function
  | Leaf -> []
  | Node (l, v, r) -> inorder l @ (v :: inorder r)

let rec preorder = function
  | Leaf -> []
  | Node (l, v, r) -> (v :: preorder l) @ preorder r
>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592

let rec postorder = function
  | Leaf -> []
  | Node (l, v, r) -> postorder l @ postorder r @ [ v ]
<<<<<<< HEAD
(*adjusted tail-recursive*)
let postorder2 tree = 
  let rec helper acc todo tree =
  match tree with 
  | Leaf -> (match todo with
            |[] -> acc
            |node::todo -> helper acc todo node)
  | Node (l, v, r) -> helper (v::acc) (l::todo) r
  in helper [] [] tree 
=======
>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592

let rec mirror = function
  | Leaf -> Leaf
  | Node (l, v, r) -> Node (mirror r, v, mirror l)
<<<<<<< HEAD
(*not yet tail-recursive*)
let mirror2 = 
  let rec mirror' acc = function
  | Leaf -> acc
  | Node (l, v, r) -> l
    
let rec length = function
  | Leaf -> 0
  | Node (l, _, r) -> 1 + length l + length r
(*adjusted tail-recursive*)
let length2 = 
  let rec length' acc = function
  | Leaf -> acc
  | Node (l, v, r) -> 
    let v_acc = acc + 1 in
    let left_acc = length' v_acc l in 
    length' left_acc r 
  in length' 0 

let rec sum = function Leaf -> 0 | Node (l, v, r) -> v + sum l + sum r
(*adjusted tail-recursive*)
let sum2 = 
  let rec sum' acc = function 
  | Leaf -> acc 
  | Node (l, v, r) -> 
    let v_acc = acc + v in
    let left_acc = sum' v_acc l in 
    sum' left_acc r 
  in sum' 0

let rec prod = function Leaf -> 1 | Node (l, v, r) -> v * prod l * prod r
(*adjusted tail-recursive*)
let prod2 = 
  let rec prod' acc = function 
  |Leaf -> acc 
  |Node (l, v, r) -> 
    let v_acc = acc*v in 
    let left_acc = prod' v_acc l in
    prod' left_acc r 
  in prod' 1

let rec map f = function
  | Leaf -> Leaf
  | Node (l, v, r) -> Node (map f l, f v, map f r)
(*TO-DO*)
=======

let rec length = function
  | Leaf -> 0
  | Node (l, _, r) -> 1 + length l + length r

let rec sum = function Leaf -> 0 | Node (l, v, r) -> sum l + sum r + v
let rec prod = function Leaf -> 0 | Node (l, v, r) -> prod l * prod r * v

>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592
let rec map f = function
  | Leaf -> Leaf
  | Node (l, v, r) -> Node (map f l, f v, map f r)

let rec fold_left f acc = function
  | Leaf -> acc
  | Node (l, v, r) ->
      let left_acc = fold_left f acc l in
      let curr_acc = f left_acc v in
      fold_left f curr_acc r
<<<<<<< HEAD
(*already tail-recursive*)
let rec fold_left f acc = function
  | Leaf -> acc
  | Node (l, v, r) ->
      let left_acc = fold_left f acc l in
      let curr_acc = f left_acc v in
      fold_left f curr_acc r

let filter p =
  let rec impl acc = function
    | Leaf -> acc
    | Node (l, v, r) ->
        let curr_filtered = if p v then insert v acc else acc in
        let left_filtered = impl curr_filtered l in
        impl left_filtered r
  in
  impl Leaf
(*already tail-recursive*)
let filter p =
  let rec impl acc = function
    | Leaf -> acc
    | Node (l, v, r) ->
        let curr_filtered = if p v then insert v acc else acc in
        let left_filtered = impl curr_filtered l in
        impl left_filtered r
  in
  impl Leaf

let partition p =
  let rec impl (yes, no) = function
    | Leaf -> (yes, no)
    | Node (l, v, r) ->
        let curr_filtered =
          if p v then (insert v yes, no) else (yes, insert v no)
        in
        let left_filtered = impl curr_filtered l in
        impl left_filtered r
  in
  impl (Leaf, Leaf)
(*TO-DO*)
let partition p =
  let rec impl (yes, no) = function
    | Leaf -> (yes, no)
    | Node (l, v, r) ->
        let curr_filtered =
          if p v then (insert v yes, no) else (yes, insert v no)
        in
        let left_filtered = impl curr_filtered l in
        impl left_filtered r
  in
  impl (Leaf, Leaf)







let init n f = 
  let rec init' n f acc =
  if n > 0 then init' (n-1) f ((f (n-1))::acc)
  else acc
  in init' n f [] 

let init 100 (x*2) = List.init 100 (x*2)

let a = init 10 (fun x -> x*2);;
let b = List.init 10 (fun x -> x*2);;

let init length generator =
  let rec helper generator length acc =
    if index = length then List.rev acc 
    else helper generator (index+1) (generator index :: acc)
  in helper generator 0 []

=======

let rec filter pred = function
  | Leaf -> Leaf
  | Node (l, v, r) as node ->
      if pred v then Node (filter pred l, v, filter pred r)
      else filter pred @@ delete v node

let partition pred t = (filter pred t, filter (Fun.negate pred) t)

let partition pred t =
  fold_left
    (fun (yes, no) x ->
      if pred x then (insert x yes, no) else (yes, insert x no))
    (Leaf, Leaf) t
>>>>>>> 99140c8a78526803e0c0680a2a6f4c3b2b216592

