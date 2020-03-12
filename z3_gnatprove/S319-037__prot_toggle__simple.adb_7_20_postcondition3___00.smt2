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
((us_split_fields (us_split_fieldsqtmk (rec__simple__pT__state Bool)))))
(define-fun us_split_fields_rec__simple__pT__state__projection ((a us_split_fields)) Bool 
  (rec__simple__pT__state a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
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

(declare-const simple__pT__state__first__bit Int)

(declare-const simple__pT__state__last__bit Int)

(declare-const simple__pT__state__position Int)

;; simple__pT__state__first__bit_axiom
  (assert (<= 0 simple__pT__state__first__bit))

;; simple__pT__state__last__bit_axiom
  (assert (< simple__pT__state__first__bit simple__pT__state__last__bit))

;; simple__pT__state__position_axiom
  (assert (<= 0 simple__pT__state__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-datatypes () ((pT__ref (pT__refqtmk (pT__content us_rep)))))
(define-fun pT__ref_pT__content__projection ((a pT__ref)) us_rep (pT__content
                                                                 a))

(declare-fun is_set (us_rep) Bool)

(declare-fun is_set__function_guard (Bool us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (= (rec__simple__pT__state
                                            (us_split_fields1
                                            temp___expr_181)) (distinct 0 0)))

;; is_set__post_axiom
  (assert true)

;; is_set__def_axiom
  (assert
  (forall ((self__ us_rep))
  (! (= (= (is_set self__) true)
     (= (rec__simple__pT__state (us_split_fields1 self__)) true)) :pattern (
  (is_set self__)) )))

(declare-const self__ Bool)

;; Assume
  (assert true)

(declare-const self__1 Bool)

;; H
  (assert (= self__1 (ite (= self__ true) false true)))

;; H
  (assert
  (forall ((self__2 Bool)) (is_set__function_guard
  (is_set (us_repqtmk (us_split_fieldsqtmk self__2)))
  (us_repqtmk (us_split_fieldsqtmk self__2)))))

;; H
  (assert (= (is_set (us_repqtmk (us_split_fieldsqtmk self__1))) true))

;; H
  (assert
  (forall ((self__2 Bool)) (is_set__function_guard
  (is_set (us_repqtmk (us_split_fieldsqtmk self__2)))
  (us_repqtmk (us_split_fieldsqtmk self__2)))))

(assert
;; defqtvc
 ;; File "simple.adb", line 6, characters 0-0
  (not (not (= (is_set (us_repqtmk (us_split_fieldsqtmk self__))) true))))
(check-sat)
