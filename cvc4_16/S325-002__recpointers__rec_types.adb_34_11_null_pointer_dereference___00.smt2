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

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__rec_types__test3__tree_3__is_null_pointer Bool)(rec__rec_types__test3__tree_3__pointer_address Int)(rec__rec_types__test3__tree_3__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__rec_types__test3__tree_3__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__rec_types__test3__tree_3__is_null_pointer a))

(define-fun us_rep_rec__rec_types__test3__tree_3__pointer_address__projection ((a us_rep)) Int 
  (rec__rec_types__test3__tree_3__pointer_address a))

(define-fun us_rep_rec__rec_types__test3__tree_3__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__rec_types__test3__tree_3__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__5__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__rec_types__test3__tree_3__is_null_pointer a) 
                        (rec__rec_types__test3__tree_3__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__rec_types__test3__tree_3__is_null_pointer a) true))
                        (and
                        (= (rec__rec_types__test3__tree_3__pointer_address a) 
                        (rec__rec_types__test3__tree_3__pointer_address b))
                        (= (rec__rec_types__test3__tree_3__pointer_value_abstr
                           a) (rec__rec_types__test3__tree_3__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((tree_3__ref 0))
(((tree_3__refqtmk (tree_3__content us_rep)))))
(define-fun tree_3__ref_tree_3__content__projection ((a tree_3__ref)) us_rep 
  (tree_3__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__rec_types__test3__tree_2_node__val integer)(rec__rec_types__test3__tree_2_node__left us_rep)(rec__rec_types__test3__tree_2_node__right us_rep)))))
(define-fun us_split_fields_rec__rec_types__test3__tree_2_node__val__projection ((a us_split_fields)) integer 
  (rec__rec_types__test3__tree_2_node__val a))

(define-fun us_split_fields_rec__rec_types__test3__tree_2_node__left__projection ((a us_split_fields)) us_rep 
  (rec__rec_types__test3__tree_2_node__left a))

(define-fun us_split_fields_rec__rec_types__test3__tree_2_node__right__projection ((a us_split_fields)) us_rep 
  (rec__rec_types__test3__tree_2_node__right a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__rec_types__test3__tree_2_node__val
                            (us_split_fields1 a))) (to_rep
                                                   (rec__rec_types__test3__tree_2_node__val
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__rec_types__test3__tree_2_node__left
                            (us_split_fields1 a))
                            (rec__rec_types__test3__tree_2_node__left
                            (us_split_fields1 b))) true))
                         (= (bool_eq
                            (rec__rec_types__test3__tree_2_node__right
                            (us_split_fields1 a))
                            (rec__rec_types__test3__tree_2_node__right
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

(declare-const rec_types__test3__tree_2_node__val__first__bit Int)

(declare-const rec_types__test3__tree_2_node__val__last__bit Int)

(declare-const rec_types__test3__tree_2_node__val__position Int)

;; rec_types__test3__tree_2_node__val__first__bit_axiom
  (assert (<= 0 rec_types__test3__tree_2_node__val__first__bit))

;; rec_types__test3__tree_2_node__val__last__bit_axiom
  (assert
  (< rec_types__test3__tree_2_node__val__first__bit rec_types__test3__tree_2_node__val__last__bit))

;; rec_types__test3__tree_2_node__val__position_axiom
  (assert (<= 0 rec_types__test3__tree_2_node__val__position))

(declare-const rec_types__test3__tree_2_node__left__first__bit Int)

(declare-const rec_types__test3__tree_2_node__left__last__bit Int)

(declare-const rec_types__test3__tree_2_node__left__position Int)

;; rec_types__test3__tree_2_node__left__first__bit_axiom
  (assert (<= 0 rec_types__test3__tree_2_node__left__first__bit))

;; rec_types__test3__tree_2_node__left__last__bit_axiom
  (assert
  (< rec_types__test3__tree_2_node__left__first__bit rec_types__test3__tree_2_node__left__last__bit))

;; rec_types__test3__tree_2_node__left__position_axiom
  (assert (<= 0 rec_types__test3__tree_2_node__left__position))

(declare-const rec_types__test3__tree_2_node__right__first__bit Int)

(declare-const rec_types__test3__tree_2_node__right__last__bit Int)

(declare-const rec_types__test3__tree_2_node__right__position Int)

;; rec_types__test3__tree_2_node__right__first__bit_axiom
  (assert (<= 0 rec_types__test3__tree_2_node__right__first__bit))

;; rec_types__test3__tree_2_node__right__last__bit_axiom
  (assert
  (< rec_types__test3__tree_2_node__right__first__bit rec_types__test3__tree_2_node__right__last__bit))

;; rec_types__test3__tree_2_node__right__position_axiom
  (assert (<= 0 rec_types__test3__tree_2_node__right__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((tree_2_node__ref 0))
(((tree_2_node__refqtmk (tree_2_node__content us_rep1)))))
(define-fun tree_2_node__ref_tree_2_node__content__projection ((a tree_2_node__ref)) us_rep1 
  (tree_2_node__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort us_main_type1 0)

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (rec__rec_types__test3__tree_2__is_null_pointer Bool)(rec__rec_types__test3__tree_2__pointer_address Int)(rec__rec_types__test3__tree_2__pointer_value_abstr us_main_type1)))))
(define-fun us_rep_rec__rec_types__test3__tree_2__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__rec_types__test3__tree_2__is_null_pointer a))

(define-fun us_rep_rec__rec_types__test3__tree_2__pointer_address__projection ((a us_rep2)) Int 
  (rec__rec_types__test3__tree_2__pointer_address a))

(define-fun us_rep_rec__rec_types__test3__tree_2__pointer_value_abstr__projection ((a us_rep2)) us_main_type1 
  (rec__rec_types__test3__tree_2__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__4__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__rec_types__test3__tree_2__is_null_pointer
                            a) (rec__rec_types__test3__tree_2__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__rec_types__test3__tree_2__is_null_pointer
                            a) true))
                         (and
                         (= (rec__rec_types__test3__tree_2__pointer_address
                            a) (rec__rec_types__test3__tree_2__pointer_address
                               b))
                         (= (rec__rec_types__test3__tree_2__pointer_value_abstr
                            a) (rec__rec_types__test3__tree_2__pointer_value_abstr
                               b)))))
                    true false))

(declare-const dummy3 us_rep2)

(declare-datatypes ((tree_2__ref 0))
(((tree_2__refqtmk (tree_2__content us_rep2)))))
(define-fun tree_2__ref_tree_2__content__projection ((a tree_2__ref)) us_rep2 
  (tree_2__content a))

(define-fun default_initial_assumption ((temp___expr_238 us_rep2)
  (temp___skip_top_level_239 Bool)) Bool (= (rec__rec_types__test3__tree_2__is_null_pointer
                                            temp___expr_238) true))

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-fun us_open (us_main_type1) us_rep1)

(declare-fun us_close (us_rep1) us_main_type1)

;; close_open
  (assert
  (forall ((x us_main_type1))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__rec_types__test3__tree_2__pointer_value ((a us_rep2)) us_rep1 
  (us_open (rec__rec_types__test3__tree_2__pointer_value_abstr a)))

(define-fun rec__rec_types__test3__tree_2__pointer_value__pred ((a us_rep2)) Bool 
  (not (= (rec__rec_types__test3__tree_2__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__rec_types__test3__tree_2__is_null_pointer us_null_pointer) true))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__rec_types__test3__tree_3_node__val integer)(rec__rec_types__test3__tree_3_node__left us_rep2)(rec__rec_types__test3__tree_3_node__middle us_rep2)(rec__rec_types__test3__tree_3_node__right us_rep2)))))
(define-fun us_split_fields_rec__rec_types__test3__tree_3_node__val__projection ((a us_split_fields2)) integer 
  (rec__rec_types__test3__tree_3_node__val a))

(define-fun us_split_fields_rec__rec_types__test3__tree_3_node__left__projection ((a us_split_fields2)) us_rep2 
  (rec__rec_types__test3__tree_3_node__left a))

(define-fun us_split_fields_rec__rec_types__test3__tree_3_node__middle__projection ((a us_split_fields2)) us_rep2 
  (rec__rec_types__test3__tree_3_node__middle a))

(define-fun us_split_fields_rec__rec_types__test3__tree_3_node__right__projection ((a us_split_fields2)) us_rep2 
  (rec__rec_types__test3__tree_3_node__right a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__4__projection ((a us_rep3)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (and
                         (= (to_rep
                            (rec__rec_types__test3__tree_3_node__val
                            (us_split_fields3 a))) (to_rep
                                                   (rec__rec_types__test3__tree_3_node__val
                                                   (us_split_fields3 b))))
                         (= (bool_eq2
                            (rec__rec_types__test3__tree_3_node__left
                            (us_split_fields3 a))
                            (rec__rec_types__test3__tree_3_node__left
                            (us_split_fields3 b))) true))
                         (and
                         (= (bool_eq2
                            (rec__rec_types__test3__tree_3_node__middle
                            (us_split_fields3 a))
                            (rec__rec_types__test3__tree_3_node__middle
                            (us_split_fields3 b))) true)
                         (= (bool_eq2
                            (rec__rec_types__test3__tree_3_node__right
                            (us_split_fields3 a))
                            (rec__rec_types__test3__tree_3_node__right
                            (us_split_fields3 b))) true)))
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

(declare-const rec_types__test3__tree_3_node__val__first__bit Int)

(declare-const rec_types__test3__tree_3_node__val__last__bit Int)

(declare-const rec_types__test3__tree_3_node__val__position Int)

;; rec_types__test3__tree_3_node__val__first__bit_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__val__first__bit))

;; rec_types__test3__tree_3_node__val__last__bit_axiom
  (assert
  (< rec_types__test3__tree_3_node__val__first__bit rec_types__test3__tree_3_node__val__last__bit))

;; rec_types__test3__tree_3_node__val__position_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__val__position))

(declare-const rec_types__test3__tree_3_node__left__first__bit Int)

(declare-const rec_types__test3__tree_3_node__left__last__bit Int)

(declare-const rec_types__test3__tree_3_node__left__position Int)

;; rec_types__test3__tree_3_node__left__first__bit_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__left__first__bit))

;; rec_types__test3__tree_3_node__left__last__bit_axiom
  (assert
  (< rec_types__test3__tree_3_node__left__first__bit rec_types__test3__tree_3_node__left__last__bit))

;; rec_types__test3__tree_3_node__left__position_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__left__position))

(declare-const rec_types__test3__tree_3_node__middle__first__bit Int)

(declare-const rec_types__test3__tree_3_node__middle__last__bit Int)

(declare-const rec_types__test3__tree_3_node__middle__position Int)

;; rec_types__test3__tree_3_node__middle__first__bit_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__middle__first__bit))

;; rec_types__test3__tree_3_node__middle__last__bit_axiom
  (assert
  (< rec_types__test3__tree_3_node__middle__first__bit rec_types__test3__tree_3_node__middle__last__bit))

;; rec_types__test3__tree_3_node__middle__position_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__middle__position))

(declare-const rec_types__test3__tree_3_node__right__first__bit Int)

(declare-const rec_types__test3__tree_3_node__right__last__bit Int)

(declare-const rec_types__test3__tree_3_node__right__position Int)

;; rec_types__test3__tree_3_node__right__first__bit_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__right__first__bit))

;; rec_types__test3__tree_3_node__right__last__bit_axiom
  (assert
  (< rec_types__test3__tree_3_node__right__first__bit rec_types__test3__tree_3_node__right__last__bit))

;; rec_types__test3__tree_3_node__right__position_axiom
  (assert (<= 0 rec_types__test3__tree_3_node__right__position))

(declare-fun user_eq2 (us_rep3 us_rep3) Bool)

(declare-const dummy4 us_rep3)

(declare-datatypes ((tree_3_node__ref 0))
(((tree_3_node__refqtmk (tree_3_node__content us_rep3)))))
(define-fun tree_3_node__ref_tree_3_node__content__projection ((a tree_3_node__ref)) us_rep3 
  (tree_3_node__content a))

(declare-fun us_open1 (us_main_type) us_rep3)

(declare-fun us_close1 (us_rep3) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close1 (us_open1 x)) x) :pattern ((us_open1 x)) )))

;; open_close
  (assert
  (forall ((x us_rep3))
  (! (= (us_open1 (us_close1 x)) x) :pattern ((us_close1 x)) )))

(define-fun rec__rec_types__test3__tree_3__pointer_value ((a us_rep)) us_rep3 
  (us_open1 (rec__rec_types__test3__tree_3__pointer_value_abstr a)))

(define-fun rec__rec_types__test3__tree_3__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__rec_types__test3__tree_3__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__rec_types__test3__tree_3__is_null_pointer us_null_pointer1) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_245 us_rep)
  (temp___skip_top_level_246 Bool)) Bool (= (rec__rec_types__test3__tree_3__is_null_pointer
                                            temp___expr_245) true))

(define-fun default_initial_assumption2 ((temp___expr_252 us_rep1)
  (temp___skip_top_level_253 Bool)) Bool (and
                                         (= (rec__rec_types__test3__tree_3__is_null_pointer
                                            (rec__rec_types__test3__tree_2_node__left
                                            (us_split_fields1
                                            temp___expr_252))) true)
                                         (= (rec__rec_types__test3__tree_3__is_null_pointer
                                            (rec__rec_types__test3__tree_2_node__right
                                            (us_split_fields1
                                            temp___expr_252))) true)))

(define-fun default_initial_assumption3 ((temp___expr_262 us_rep3)
  (temp___skip_top_level_263 Bool)) Bool (and
                                         (and
                                         (= (rec__rec_types__test3__tree_2__is_null_pointer
                                            (rec__rec_types__test3__tree_3_node__left
                                            (us_split_fields3
                                            temp___expr_262))) true)
                                         (= (rec__rec_types__test3__tree_2__is_null_pointer
                                            (rec__rec_types__test3__tree_3_node__middle
                                            (us_split_fields3
                                            temp___expr_262))) true))
                                         (= (rec__rec_types__test3__tree_2__is_null_pointer
                                            (rec__rec_types__test3__tree_3_node__right
                                            (us_split_fields3
                                            temp___expr_262))) true)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "rec_types.ads", line 45, characters 0-0
  (not
  (forall ((us_next_pointer_address Int)
  (rec_types__test3__p_tree__x__assume us_rep2)
  (x__pointer_value us_split_fields) (x__pointer_address Int)
  (x__is_null_pointer Bool))
  (=>
  (= (and (ite (and
               (not
               (= (rec__rec_types__test3__tree_2__is_null_pointer
                  rec_types__test3__p_tree__x__assume) true))
               (= (rec__rec_types__test3__tree_2__pointer_address
                  rec_types__test3__p_tree__x__assume) us_next_pointer_address))
          true false) (ite (= (rec__rec_types__test3__tree_2__pointer_value
                              rec_types__test3__p_tree__x__assume) (us_repqtmk1
                                                                   (us_split_fieldsqtmk
                                                                   rliteral
                                                                   us_null_pointer1
                                                                   us_null_pointer1)))
                      true false)) true)
  (=>
  (= (us_repqtmk1 x__pointer_value) (rec__rec_types__test3__tree_2__pointer_value
                                    rec_types__test3__p_tree__x__assume))
  (=>
  (= x__pointer_address (rec__rec_types__test3__tree_2__pointer_address
                        rec_types__test3__p_tree__x__assume))
  (=>
  (= x__is_null_pointer (rec__rec_types__test3__tree_2__is_null_pointer
                        rec_types__test3__p_tree__x__assume))
  (rec__rec_types__test3__tree_2__pointer_value__pred
  (us_repqtmk2 x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value)))))))))))
(check-sat)
(exit)
