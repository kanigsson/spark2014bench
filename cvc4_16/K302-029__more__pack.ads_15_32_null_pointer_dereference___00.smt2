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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__pack__acc__is_null_pointer Bool)(rec__pack__acc__pointer_address Int)(rec__pack__acc__pointer_value integer)))))
(define-fun us_rep_rec__pack__acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__pack__acc__is_null_pointer a))

(define-fun us_rep_rec__pack__acc__pointer_address__projection ((a us_rep)) Int 
  (rec__pack__acc__pointer_address a))

(define-fun us_rep_rec__pack__acc__pointer_value__projection ((a us_rep)) integer 
  (rec__pack__acc__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__pack__acc__is_null_pointer a) (rec__pack__acc__is_null_pointer
                                                               b))
                        (=>
                        (not (= (rec__pack__acc__is_null_pointer a) true))
                        (and
                        (= (rec__pack__acc__pointer_address a) (rec__pack__acc__pointer_address
                                                               b))
                        (= (rec__pack__acc__pointer_value a) (rec__pack__acc__pointer_value
                                                             b)))))
                   true false))

(define-fun rec__pack__acc__pointer_value__pred ((a us_rep)) Bool (not
                                                                  (= 
                                                                  (rec__pack__acc__is_null_pointer
                                                                  a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__pack__acc__is_null_pointer us_null_pointer) true))

(declare-const dummy1 us_rep)

(declare-datatypes ((acc__ref 0))
(((acc__refqtmk (acc__content us_rep)))))
(define-fun acc__ref_acc__content__projection ((a acc__ref)) us_rep (acc__content
                                                                    a))

(define-fun default_initial_assumption ((temp___expr_159 us_rep)
  (temp___skip_top_level_160 Bool)) Bool (= (rec__pack__acc__is_null_pointer
                                            temp___expr_159) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "pack.ads", line 15, characters 0-0
  (not
  (forall ((x Bool) (y__pointer_value integer) (y__pointer_address Int)
  (y__is_null_pointer Bool))
  (=> (exists ((spark__branch Bool)) (= spark__branch x))
  (rec__pack__acc__pointer_value__pred
  (us_repqtmk y__is_null_pointer y__pointer_address y__pointer_value))))))
(check-sat)
(exit)
