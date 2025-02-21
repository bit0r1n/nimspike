import as_orderedmap

type as_hashmap_iterator* = as_orderedmap_iterator

let
  as_hashmap_iterator_init* = as_orderedmap_iterator_init
  as_hashmap_iterator_new* = as_orderedmap_iterator_new
  as_hashmap_iterator_destroy* = as_orderedmap_iterator_destroy

  as_hashmap_iterator_has_next* = as_orderedmap_iterator_has_next
  as_hashmap_iterator_next* = as_orderedmap_iterator_next