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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__timer__run_stateT__running Bool)))))
(define-fun us_split_fields_rec__timer__run_stateT__running__projection ((a us_split_fields)) Bool 
  (rec__timer__run_stateT__running a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
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

(declare-const timer__run_stateT__running__first__bit Int)

(declare-const timer__run_stateT__running__last__bit Int)

(declare-const timer__run_stateT__running__position Int)

;; timer__run_stateT__running__first__bit_axiom
  (assert (<= 0 timer__run_stateT__running__first__bit))

;; timer__run_stateT__running__last__bit_axiom
  (assert
  (< timer__run_stateT__running__first__bit timer__run_stateT__running__last__bit))

;; timer__run_stateT__running__position_axiom
  (assert (<= 0 timer__run_stateT__running__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-datatypes ((run_stateT__ref 0))
(((run_stateT__refqtmk (run_stateT__content us_rep)))))
(define-fun run_stateT__ref_run_stateT__content__projection ((a run_stateT__ref)) us_rep 
  (run_stateT__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(define-fun default_initial_assumption ((temp___expr_189 us_rep)
  (temp___skip_top_level_190 Bool)) Bool (= (rec__timer__run_stateT__running
                                            (us_split_fields1
                                            temp___expr_189)) (distinct 0 0)))

(assert
;; defqtvc
 ;; File "timer.adb", line 16, characters 0-0
  (not (<= 98 98)))
(check-sat)
(exit)
