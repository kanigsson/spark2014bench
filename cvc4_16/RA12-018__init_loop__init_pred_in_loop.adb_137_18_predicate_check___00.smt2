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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__init_pred_in_loop__wrong_partial_init__f1 integer)(rec__init_pred_in_loop__wrong_partial_init__f2 integer)))))
(define-fun us_split_fields_rec__init_pred_in_loop__wrong_partial_init__f1__projection ((a us_split_fields)) integer 
  (rec__init_pred_in_loop__wrong_partial_init__f1 a))

(define-fun us_split_fields_rec__init_pred_in_loop__wrong_partial_init__f2__projection ((a us_split_fields)) integer 
  (rec__init_pred_in_loop__wrong_partial_init__f2 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__5__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__init_pred_in_loop__wrong_partial_init__f1
                           (us_split_fields1 a))) (to_rep
                                                  (rec__init_pred_in_loop__wrong_partial_init__f1
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__init_pred_in_loop__wrong_partial_init__f2
                           (us_split_fields1 a))) (to_rep
                                                  (rec__init_pred_in_loop__wrong_partial_init__f2
                                                  (us_split_fields1 b)))))
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

(declare-const init_pred_in_loop__wrong_partial_init__f1__first__bit Int)

(declare-const init_pred_in_loop__wrong_partial_init__f1__last__bit Int)

(declare-const init_pred_in_loop__wrong_partial_init__f1__position Int)

;; init_pred_in_loop__wrong_partial_init__f1__first__bit_axiom
  (assert (<= 0 init_pred_in_loop__wrong_partial_init__f1__first__bit))

;; init_pred_in_loop__wrong_partial_init__f1__last__bit_axiom
  (assert
  (< init_pred_in_loop__wrong_partial_init__f1__first__bit init_pred_in_loop__wrong_partial_init__f1__last__bit))

;; init_pred_in_loop__wrong_partial_init__f1__position_axiom
  (assert (<= 0 init_pred_in_loop__wrong_partial_init__f1__position))

(declare-const init_pred_in_loop__wrong_partial_init__f2__first__bit Int)

(declare-const init_pred_in_loop__wrong_partial_init__f2__last__bit Int)

(declare-const init_pred_in_loop__wrong_partial_init__f2__position Int)

;; init_pred_in_loop__wrong_partial_init__f2__first__bit_axiom
  (assert (<= 0 init_pred_in_loop__wrong_partial_init__f2__first__bit))

;; init_pred_in_loop__wrong_partial_init__f2__last__bit_axiom
  (assert
  (< init_pred_in_loop__wrong_partial_init__f2__first__bit init_pred_in_loop__wrong_partial_init__f2__last__bit))

;; init_pred_in_loop__wrong_partial_init__f2__position_axiom
  (assert (<= 0 init_pred_in_loop__wrong_partial_init__f2__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((wrong_partial_init__ref 0))
(((wrong_partial_init__refqtmk (wrong_partial_init__content us_rep)))))
(define-fun wrong_partial_init__ref_wrong_partial_init__content__projection ((a wrong_partial_init__ref)) us_rep 
  (wrong_partial_init__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun my_false (tuple0) Bool)

(declare-fun my_false__function_guard (Bool tuple0) Bool)

;; temp___result_237'def
  (assert (my_false__function_guard (my_false Tuple0) Tuple0))

(define-fun dynamic_invariant ((temp___expr_235 us_rep)
  (temp___is_init_231 Bool) (temp___skip_constant_232 Bool)
  (temp___do_toplevel_233 Bool)
  (temp___do_typ_inv_234 Bool)) Bool (=> (= temp___do_toplevel_233 true)
                                     (= (my_false Tuple0) true)))

(define-fun default_initial_assumption ((temp___expr_238 us_rep)
  (temp___skip_top_level_239 Bool)) Bool (= (to_rep
                                            (rec__init_pred_in_loop__wrong_partial_init__f1
                                            (us_split_fields1
                                            temp___expr_238))) 0))

;; temp___result_243'def
  (assert (my_false__function_guard (my_false Tuple0) Tuple0))

(define-fun dynamic_predicate ((temp___241 us_rep)) Bool (= (my_false Tuple0) true))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; my_false__post_axiom
  (assert true)

;; my_false__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (not (= (my_false us_void_param) true)) :pattern ((my_false
                                                       us_void_param)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(assert
;; defqtvc
 ;; File "init_pred_in_loop.adb", line 130, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields))
  (=> (default_initial_assumption (us_repqtmk x__split_fields) false)
  (=> (dynamic_invariant (us_repqtmk x__split_fields) false false true true)
  (dynamic_predicate (us_repqtmk (us_split_fieldsqtmk rliteral rliteral))))))))
(check-sat)
(exit)
