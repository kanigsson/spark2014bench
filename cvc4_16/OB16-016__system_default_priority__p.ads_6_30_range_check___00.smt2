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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__p__poT__x Bool)))))
(define-fun us_split_fields_rec__p__poT__x__projection ((a us_split_fields)) Bool 
  (rec__p__poT__x a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
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

(declare-const p__poT__x__first__bit Int)

(declare-const p__poT__x__last__bit Int)

(declare-const p__poT__x__position Int)

;; p__poT__x__first__bit_axiom
  (assert (<= 0 p__poT__x__first__bit))

;; p__poT__x__last__bit_axiom
  (assert (< p__poT__x__first__bit p__poT__x__last__bit))

;; p__poT__x__position_axiom
  (assert (<= 0 p__poT__x__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-datatypes ((poT__ref 0))
(((poT__refqtmk (poT__content us_rep)))))
(define-fun poT__ref_poT__content__projection ((a poT__ref)) us_rep (poT__content
                                                                    a))

(declare-sort any_priority 0)

(declare-fun any_priorityqtint (any_priority) Int)

;; any_priority'axiom
  (assert
  (forall ((i any_priority))
  (and (<= 0 (any_priorityqtint i)) (<= (any_priorityqtint i) 98))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 98)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (any_priority any_priority) Bool)

(declare-const dummy any_priority)

(declare-datatypes ((any_priority__ref 0))
(((any_priority__refqtmk (any_priority__content any_priority)))))
(define-fun any_priority__ref_any_priority__content__projection ((a any_priority__ref)) any_priority 
  (any_priority__content a))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= 0 98)) (in_range1 temp___expr_158)))

(define-fun default_initial_assumption ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (= (rec__p__poT__x
                                            (us_split_fields1
                                            temp___expr_180)) (distinct 0 0)))

(declare-const self__ us_rep)

(assert
;; defqtvc
 ;; File "p.ads", line 5, characters 0-0
  (not (<= 0 48)))
(check-sat)
(exit)
