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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(declare-const dummy1 us_rep)

(declare-datatypes ((node_access__ref 0))
(((node_access__refqtmk (node_access__content us_rep)))))
(define-fun node_access__ref_node_access__content__projection ((a node_access__ref)) us_rep 
  (node_access__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__binary_search_trees__tree_node__data integer)(rec__binary_search_trees__tree_node__left us_rep)(rec__binary_search_trees__tree_node__right us_rep)))))
(define-fun us_split_fields_rec__binary_search_trees__tree_node__data__projection ((a us_split_fields)) integer 
  (rec__binary_search_trees__tree_node__data a))

(define-fun us_split_fields_rec__binary_search_trees__tree_node__left__projection ((a us_split_fields)) us_rep 
  (rec__binary_search_trees__tree_node__left a))

(define-fun us_split_fields_rec__binary_search_trees__tree_node__right__projection ((a us_split_fields)) us_rep 
  (rec__binary_search_trees__tree_node__right a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__binary_search_trees__tree_node__data
                            (us_split_fields1 a))) (to_rep
                                                   (rec__binary_search_trees__tree_node__data
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__binary_search_trees__tree_node__left
                            (us_split_fields1 a))
                            (rec__binary_search_trees__tree_node__left
                            (us_split_fields1 b))) true))
                         (= (bool_eq
                            (rec__binary_search_trees__tree_node__right
                            (us_split_fields1 a))
                            (rec__binary_search_trees__tree_node__right
                            (us_split_fields1 b))) true))
                    true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

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

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((tree_node__ref 0))
(((tree_node__refqtmk (tree_node__content us_rep1)))))
(define-fun tree_node__ref_tree_node__content__projection ((a tree_node__ref)) us_rep1 
  (tree_node__content a))

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__binary_search_trees__node_access__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__binary_search_trees__node_access__pointer_value_abstr a)))

(define-fun rec__binary_search_trees__node_access__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__binary_search_trees__node_access__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__binary_search_trees__node_access__is_null_pointer us_null_pointer) true))

(declare-const dummy3 us_rep)

(declare-datatypes ((name__ref 0))
(((name__refqtmk (name__content us_rep)))))
(define-fun name__ref_name__content__projection ((a name__ref)) us_rep 
  (name__content a))

(define-fun default_initial_assumption ((temp___expr_204 us_rep)
  (temp___skip_top_level_205 Bool)) Bool (= (rec__binary_search_trees__node_access__is_null_pointer
                                            temp___expr_204) true))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption1 ((temp___expr_165 us_rep)
  (temp___skip_top_level_166 Bool)) Bool (= (rec__binary_search_trees__node_access__is_null_pointer
                                            temp___expr_165) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption2 ((temp___expr_184 us_rep1)
  (temp___skip_top_level_185 Bool)) Bool (and
                                         (= (rec__binary_search_trees__node_access__is_null_pointer
                                            (rec__binary_search_trees__tree_node__left
                                            (us_split_fields1
                                            temp___expr_184))) true)
                                         (= (rec__binary_search_trees__node_access__is_null_pointer
                                            (rec__binary_search_trees__tree_node__right
                                            (us_split_fields1
                                            temp___expr_184))) true)))

(assert
;; defqtvc
 ;; File "binary_search_trees.adb", line 12, characters 0-0
  (not
  (forall ((starting_at__pointer_value us_split_fields)
  (starting_at__pointer_address Int) (starting_at__is_null_pointer Bool)
  (starting_at__pointer_value1 us_split_fields)
  (starting_at__pointer_address1 Int) (starting_at__is_null_pointer1 Bool))
  (=>
  (exists ((spark__branch Bool))
  (and
  (= spark__branch (not (bool_eq
                        (us_repqtmk starting_at__is_null_pointer
                        starting_at__pointer_address
                        (us_close (us_repqtmk1 starting_at__pointer_value)))
                        us_null_pointer)))
  (ite (= spark__branch true)
  (exists ((binary_search_trees__free__free_node__starting_at__is_null Bool)
  (binary_search_trees__free__free_node__starting_at__addr Int)
  (binary_search_trees__free__free_node__starting_at__value us_split_fields))
  (and
  (= (bool_eq
     (us_repqtmk binary_search_trees__free__free_node__starting_at__is_null
     binary_search_trees__free__free_node__starting_at__addr
     (us_close
     (us_repqtmk1 binary_search_trees__free__free_node__starting_at__value)))
     us_null_pointer) true)
  (let ((q_ (us_split_fields1
            (rec__binary_search_trees__node_access__pointer_value
            (us_repqtmk starting_at__is_null_pointer
            starting_at__pointer_address
            (us_close (us_repqtmk1 starting_at__pointer_value)))))))
  (exists ((starting_at__pointer_value2 us_split_fields))
  (and
  (= (us_repqtmk1 starting_at__pointer_value2) (rec__binary_search_trees__node_access__pointer_value
                                               (us_repqtmk
                                               starting_at__is_null_pointer
                                               starting_at__pointer_address
                                               (us_close
                                               (us_repqtmk1
                                               (us_split_fieldsqtmk
                                               (rec__binary_search_trees__tree_node__data
                                               q_)
                                               (us_repqtmk
                                               binary_search_trees__free__free_node__starting_at__is_null
                                               binary_search_trees__free__free_node__starting_at__addr
                                               (us_close
                                               (us_repqtmk1
                                               binary_search_trees__free__free_node__starting_at__value)))
                                               (rec__binary_search_trees__tree_node__right
                                               q_)))))))
  (exists ((binary_search_trees__free__free_node__starting_at__is_null1 Bool)
  (binary_search_trees__free__free_node__starting_at__addr1 Int)
  (binary_search_trees__free__free_node__starting_at__value1 us_split_fields))
  (and
  (= (bool_eq
     (us_repqtmk binary_search_trees__free__free_node__starting_at__is_null1
     binary_search_trees__free__free_node__starting_at__addr1
     (us_close
     (us_repqtmk1 binary_search_trees__free__free_node__starting_at__value1)))
     us_null_pointer) true)
  (let ((q_1 (us_split_fields1
             (rec__binary_search_trees__node_access__pointer_value
             (us_repqtmk starting_at__is_null_pointer
             starting_at__pointer_address
             (us_close (us_repqtmk1 starting_at__pointer_value2)))))))
  (exists ((starting_at__pointer_value3 us_split_fields))
  (and
  (= (us_repqtmk1 starting_at__pointer_value3) (rec__binary_search_trees__node_access__pointer_value
                                               (us_repqtmk
                                               starting_at__is_null_pointer
                                               starting_at__pointer_address
                                               (us_close
                                               (us_repqtmk1
                                               (us_split_fieldsqtmk
                                               (rec__binary_search_trees__tree_node__data
                                               q_1)
                                               (rec__binary_search_trees__tree_node__left
                                               q_1)
                                               (us_repqtmk
                                               binary_search_trees__free__free_node__starting_at__is_null1
                                               binary_search_trees__free__free_node__starting_at__addr1
                                               (us_close
                                               (us_repqtmk1
                                               binary_search_trees__free__free_node__starting_at__value1)))))))))
  (exists ((starting_at__pointer_address2 Int)
  (starting_at__is_null_pointer2 Bool)
  (binary_search_trees__free_tree_node__x__value us_split_fields))
  (and (= starting_at__is_null_pointer2 true)
  (and
  (= (us_repqtmk1 starting_at__pointer_value1) (rec__binary_search_trees__node_access__pointer_value
                                               (us_repqtmk
                                               starting_at__is_null_pointer2
                                               starting_at__pointer_address2
                                               (us_close
                                               (us_repqtmk1
                                               binary_search_trees__free_tree_node__x__value)))))
  (and (= starting_at__pointer_address1 starting_at__pointer_address2)
  (= starting_at__is_null_pointer1 starting_at__is_null_pointer2)))))))))))))))
  (and
  (and (= starting_at__pointer_value1 starting_at__pointer_value)
  (= starting_at__pointer_address1 starting_at__pointer_address))
  (= starting_at__is_null_pointer1 starting_at__is_null_pointer)))))
  (= (bool_eq
     (us_repqtmk starting_at__is_null_pointer1 starting_at__pointer_address1
     (us_close (us_repqtmk1 starting_at__pointer_value1))) us_null_pointer) true)))))
(check-sat)
(exit)
