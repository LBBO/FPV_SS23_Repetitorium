# Collections

Over the past few days, you have gotten to know a couple of collections. Today, we will make them a bit more organized!

1. Foldable\
Define a module type `Foldable` that requires an implementation type t and a `fold_left` function with the same signature we are used to.
  - `type 'a t` that defines how the foldable (the collection) is typed
  - `empty : 'a t` is the empty collection
  - `insert : 'a -> 'a t -> 'a t` inserts an element into the collection
  - `fold_left : ('a -> 'b -> 'a) -> 'a -> 'b t -> 'a` defines fold_left on the collection
2. Collection\
Define a `Collection` functor that takes a foldable and implements the following functions:
  - `size : 'a t -> int`
  - `map : ('a -> 'b) -> 'a t -> 'b t`
  - `filter : ('a -> bool) -> 'a t -> 'a t`
  - `delete : 'a -> 'a t -> 'a t`
  - `find_opt : ('a -> bool) -> 'a t -> 'a option`
  - `iter : ('a -> unit) -> 'a t -> unit`
3. ListCollection\
Implement a Collection based on Lists. Do not implement all of the functions manually
4. BstCollection\
Implement a Collection based on BSTs. Do not implement all of the functions manually
5. CollectionMap\
Implement a Map based on a Collection. The map should have the following features:
  - `type k` and `type v` for keys and values; `type ('k, 'v) t` for the implementation type
  - `empty : ('k, 'v) t`
  - `get_opt : 'k -> ('k, 'v) t -> 'v option`
  - `set : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t`
  - `delete : 'k -> ('k, 'v) t -> ('k, 'v) t`
  - `contains : 'k -> ('k, 'v) t -> bool`
6. Play with your implementations and test them in the playground!
