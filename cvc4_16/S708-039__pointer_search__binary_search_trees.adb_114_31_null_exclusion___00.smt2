(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__binary_search_trees__node_access__is_null_pointer Bool)(rec__binary_search_trees__node_access__pointer_address Int)(rec__binary_search_trees__node_access__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__binary_search_trees__node_access__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__binary_search_trees__node_access__is_null_pointer a))

(define-fun us_rep_rec__binary_search_trees__node_access__pointer_address__projection ((a us_rep)) Int 
  (rec__binary_search_trees__node_access__pointer_address a))

(define-fun us_rep_rec__binary_search_trees__node_access__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__binary_search_trees__node_access__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__binary_search_trees__node_access__is_null_pointer
                           a) (rec__binary_search_trees__node_access__is_null_pointer
                              b))
                        (=>
                        (not
                        (= (rec__binary_search_trees__node_access__is_null_pointer
                           a) true))
                        (and
                        (= (rec__binary_search_trees__node_access__pointer_address
                           a) (rec__binary_search_trees__node_access__pointer_address
                              b))
                        (= (rec__binary_search_trees__node_access__pointer_value_abstr
                           a) (rec__binary_search_trees__node_access__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy2 us_rep)

(declare-datatypes ((node_access__ref 0))
(((node_access__refqtmk (node_access__content us_rep)))))
(define-fun node_access__ref_node_access__content__projection ((a node_access__ref)) us_rep 
  (node_access__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__binary_search_trees__binary_search_tree__root us_rep)(rec__binary_search_trees__binary_search_tree__size natural)))))
(define-fun us_split_fields_rec__binary_search_trees__binary_search_tree__root__projection ((a us_split_fields)) us_rep 
  (rec__binary_search_trees__binary_search_tree__root a))

(define-fun us_split_fields_rec__binary_search_trees__binary_search_tree__size__projection ((a us_split_fields)) natural 
  (rec__binary_search_trees__binary_search_tree__size a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const binary_search_trees__binary_search_tree__root__first__bit Int)

(declare-const binary_search_trees__binary_search_tree__root__last__bit Int)

(declare-const binary_search_trees__binary_search_tree__root__position Int)

;; binary_search_trees__binary_search_tree__root__first__bit_axiom
  (assert (<= 0 binary_search_trees__binary_search_tree__root__first__bit))

;; binary_search_trees__binary_search_tree__root__last__bit_axiom
  (assert
  (< binary_search_trees__binary_search_tree__root__first__bit binary_search_trees__binary_search_tree__root__last__bit))

;; binary_search_trees__binary_search_tree__root__position_axiom
  (assert (<= 0 binary_search_trees__binary_search_tree__root__position))

(declare-const binary_search_trees__binary_search_tree__size__first__bit Int)

(declare-const binary_search_trees__binary_search_tree__size__last__bit Int)

(declare-const binary_search_trees__binary_search_tree__size__position Int)

;; binary_search_trees__binary_search_tree__size__first__bit_axiom
  (assert (<= 0 binary_search_trees__binary_search_tree__size__first__bit))

;; binary_search_trees__binary_search_tree__size__last__bit_axiom
  (assert
  (< binary_search_trees__binary_search_tree__size__first__bit binary_search_trees__binary_search_tree__size__last__bit))

;; binary_search_trees__binary_search_tree__size__position_axiom
  (assert (<= 0 binary_search_trees__binary_search_tree__size__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((binary_search_tree__ref 0))
(((binary_search_tree__refqtmk (binary_search_tree__content us_rep1)))))
(define-fun binary_search_tree__ref_binary_search_tree__content__projection ((a binary_search_tree__ref)) us_rep1 
  (binary_search_tree__content a))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__binary_search_trees__tree_node__data integer)(rec__binary_search_trees__tree_node__left us_rep)(rec__binary_search_trees__tree_node__right us_rep)))))
(define-fun us_split_fields_rec__binary_search_trees__tree_node__data__projection ((a us_split_fields2)) integer 
  (rec__binary_search_trees__tree_node__data a))

(define-fun us_split_fields_rec__binary_search_trees__tree_node__left__projection ((a us_split_fields2)) us_rep 
  (rec__binary_search_trees__tree_node__left a))

(define-fun us_split_fields_rec__binary_search_trees__tree_node__right__projection ((a us_split_fields2)) us_rep 
  (rec__binary_search_trees__tree_node__right a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__binary_search_trees__tree_node__data
                            (us_split_fields3 a))) (to_rep
                                                   (rec__binary_search_trees__tree_node__data
                                                   (us_split_fields3 b))))
                         (= (bool_eq
                            (rec__binary_search_trees__tree_node__left
                            (us_split_fields3 a))
                            (rec__binary_search_trees__tree_node__left
                            (us_split_fields3 b))) true))
                         (= (bool_eq
                            (rec__binary_search_trees__tree_node__right
                            (us_split_fields3 a))
                            (rec__binary_search_trees__tree_node__right
                            (us_split_fields3 b))) true))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const binary_search_trees__tree_node__data__first__bit Int)

(declare-const binary_search_trees__tree_node__data__last__bit Int)

(declare-const binary_search_trees__tree_node__data__position Int)

;; binary_search_trees__tree_node__data__first__bit_axiom
  (assert (<= 0 binary_search_trees__tree_node__data__first__bit))

;; binary_search_trees__tree_node__data__last__bit_axiom
  (assert
  (< binary_search_trees__tree_node__data__first__bit binary_search_trees__tree_node__data__last__bit))

;; binary_search_trees__tree_node__data__position_axiom
  (assert (<= 0 binary_search_trees__tree_node__data__position))

(declare-const binary_search_trees__tree_node__left__first__bit Int)

(declare-const binary_search_trees__tree_node__left__last__bit Int)

(declare-const binary_search_trees__tree_node__left__position Int)

;; binary_search_trees__tree_node__left__first__bit_axiom
  (assert (<= 0 binary_search_trees__tree_node__left__first__bit))

;; binary_search_trees__tree_node__left__last__bit_axiom
  (assert
  (< binary_search_trees__tree_node__left__first__bit binary_search_trees__tree_node__left__last__bit))

;; binary_search_trees__tree_node__left__position_axiom
  (assert (<= 0 binary_search_trees__tree_node__left__position))

(declare-const binary_search_trees__tree_node__right__first__bit Int)

(declare-const binary_search_trees__tree_node__right__last__bit Int)

(declare-const binary_search_trees__tree_node__right__position Int)

;; binary_search_trees__tree_node__right__first__bit_axiom
  (assert (<= 0 binary_search_trees__tree_node__right__first__bit))

;; binary_search_trees__tree_node__right__last__bit_axiom
  (assert
  (< binary_search_trees__tree_node__right__first__bit binary_search_trees__tree_node__right__last__bit))

;; binary_search_trees__tree_node__right__position_axiom
  (assert (<= 0 binary_search_trees__tree_node__right__position))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes ((tree_node__ref 0))
(((tree_node__refqtmk (tree_node__content us_rep2)))))
(define-fun tree_node__ref_tree_node__content__projection ((a tree_node__ref)) us_rep2 
  (tree_node__content a))

(declare-fun us_open (us_main_type) us_rep2)

(declare-fun us_close (us_rep2) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep2))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__binary_search_trees__node_access__pointer_value ((a us_rep)) us_rep2 
  (us_open (rec__binary_search_trees__node_access__pointer_value_abstr a)))

(define-fun rec__binary_search_trees__node_access__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__binary_search_trees__node_access__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__binary_search_trees__node_access__is_null_pointer us_null_pointer) true))

(define-fun default_initial_assumption ((temp___expr_171 us_rep1)
  (temp___skip_top_level_172 Bool)) Bool (and
                                         (= (rec__binary_search_trees__binary_search_tree__root
                                            (us_split_fields1
                                            temp___expr_171)) us_null_pointer)
                                         (= (to_rep1
                                            (rec__binary_search_trees__binary_search_tree__size
                                            (us_split_fields1
                                            temp___expr_171))) 0)))

(declare-fun size (us_rep1) Int)

(declare-fun size__function_guard (Int us_rep1) Bool)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

;; size__post_axiom
  (assert
  (forall ((tree us_rep1))
  (! (let ((result (size tree)))
     (=> (size__function_guard result tree) (dynamic_invariant result true
     false true true))) :pattern ((size tree)) )))

;; size__def_axiom
  (assert
  (forall ((tree us_rep1))
  (! (= (size tree) (to_rep1
                    (rec__binary_search_trees__binary_search_tree__size
                    (us_split_fields1 tree)))) :pattern ((size tree)) )))

(declare-const tree us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const dummy5 us_rep)

(declare-datatypes ((t12b__ref 0))
(((t12b__refqtmk (t12b__content us_rep)))))
(define-fun t12b__ref_t12b__content__projection ((a t12b__ref)) us_rep 
  (t12b__content a))

(declare-const dummy6 us_rep)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content us_rep)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) us_rep 
  (t11b__content a))

(declare-fun minimum_node (us_rep) us_rep)

(declare-fun minimum_node__function_guard (us_rep us_rep) Bool)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_164 us_rep)
  (temp___skip_top_level_165 Bool)) Bool (= (rec__binary_search_trees__node_access__is_null_pointer
                                            temp___expr_164) true))

(define-fun default_initial_assumption2 ((temp___expr_180 us_rep2)
  (temp___skip_top_level_181 Bool)) Bool (and
                                         (= (rec__binary_search_trees__node_access__is_null_pointer
                                            (rec__binary_search_trees__tree_node__left
                                            (us_split_fields3
                                            temp___expr_180))) true)
                                         (= (rec__binary_search_trees__node_access__is_null_pointer
                                            (rec__binary_search_trees__tree_node__right
                                            (us_split_fields3
                                            temp___expr_180))) true)))

(assert
;; defqtvc
 ;; File "binary_search_trees.ads", line 19, characters 0-0
  (not
  (=> (size__function_guard (size tree) tree)
  (=> (< 0 (size tree))
  (rec__binary_search_trees__node_access__pointer_value__pred
  (rec__binary_search_trees__binary_search_tree__root
  (us_split_fields1 tree)))))))
(check-sat)
(exit)
