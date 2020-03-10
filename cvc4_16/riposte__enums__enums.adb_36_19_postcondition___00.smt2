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

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort big_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (big_type big_type) Bool)

(declare-const dummy big_type)

(declare-datatypes ((big_type__ref 0))
(((big_type__refqtmk (big_type__content big_type)))))
(define-fun big_type__ref_big_type__content__projection ((a1 big_type__ref)) big_type 
  (big_type__content a1))

(define-fun dynamic_invariant ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 8)) (in_range1 temp___expr_169)))

(declare-sort smaller_type 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 3 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (smaller_type smaller_type) Bool)

(declare-const dummy1 smaller_type)

(declare-datatypes ((smaller_type__ref 0))
(((smaller_type__refqtmk (smaller_type__content smaller_type)))))
(define-fun smaller_type__ref_smaller_type__content__projection ((a1 smaller_type__ref)) smaller_type 
  (smaller_type__content a1))

(define-fun dynamic_invariant1 ((temp___expr_176 Int)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (<= 3 5)) (in_range2 temp___expr_176)))

(assert
;; defqtvc
 ;; File "enums.adb", line 33, characters 0-0
  (not
  (forall ((enums__enum_equals_subtype__result Bool))
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant1 b true false true true)
  (=> (= enums__enum_equals_subtype__result (ite (= a b) true false))
  (=> (= enums__enum_equals_subtype__result true) (= a b))))))))
(check-sat)
(exit)
