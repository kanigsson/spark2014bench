(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__test_constrained__cc__b Bool)))))
(define-fun us_split_discrs_rec__test_constrained__cc__b__projection ((a us_split_discrs)) Bool 
  (rec__test_constrained__cc__b a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__test_constrained__cc__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__test_constrained__cc__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                   true false))

(define-fun in_range1 ((rec__test_constrained__cc__b1 Bool)
  (a us_split_discrs)) Bool (= rec__test_constrained__cc__b1 (rec__test_constrained__cc__b
                                                             a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_constrained__cc__b__first__bit Int)

(declare-const test_constrained__cc__b__last__bit Int)

(declare-const test_constrained__cc__b__position Int)

;; test_constrained__cc__b__first__bit_axiom
  (assert (<= 0 test_constrained__cc__b__first__bit))

;; test_constrained__cc__b__last__bit_axiom
  (assert
  (< test_constrained__cc__b__first__bit test_constrained__cc__b__last__bit))

;; test_constrained__cc__b__position_axiom
  (assert (<= 0 test_constrained__cc__b__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes () ((cc__ref (cc__refqtmk (cc__content us_rep)))))
(define-fun cc__ref_cc__content__projection ((a cc__ref)) us_rep (cc__content
                                                                 a))

(declare-const x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_185 us_rep)
  (temp___skip_top_level_186 Bool)) Bool (= (rec__test_constrained__cc__b
                                            (us_split_discrs1
                                            temp___expr_185)) (distinct 0 0)))

;; Assume
  (assert true)

(declare-const test_constrained__get_constr__result Bool)

;; H
  (assert (= test_constrained__get_constr__result true))

(assert
;; defqtvc
 ;; File "test_constrained.adb", line 8, characters 0-0
  (not (= test_constrained__get_constr__result true)))
(check-sat)
