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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i1s Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort vowels 0)

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (vowels vowels) Bool)

(declare-const dummy vowels)

(declare-datatypes ((vowels__ref 0))
(((vowels__refqtmk (vowels__content vowels)))))
(define-fun vowels__ref_vowels__content__projection ((a vowels__ref)) vowels 
  (vowels__content a))

(define-fun dynamic_invariant ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 4)) (in_range temp___expr_169))
                                     (=> (= temp___do_toplevel_167 true)
                                     (=> (= temp___is_init_165 true)
                                     (or
                                     (and (<= 0 temp___expr_169)
                                     (<= temp___expr_169 0))
                                     (and (<= 4 temp___expr_169)
                                     (<= temp___expr_169 4)))))))

(define-fun dynamic_predicate ((temp___173 Int)) Bool (or
                                                      (and (<= 0 temp___173)
                                                      (<= temp___173 0))
                                                      (and (<= 4 temp___173)
                                                      (<= temp___173 4))))

(assert
;; defqtvc
 ;; File "tests.ads", line 4, characters 0-0
  (not
  (forall ((v Int))
  (=> (dynamic_invariant i1s true false true true)
  (=> (dynamic_invariant i1s true false true true)
  (=> (dynamic_invariant v true false true true)
  (=> (not (= v 1)) (or (and (<= 0 1) (<= 1 0)) (and (<= 4 1) (<= 1 4))))))))))
(check-sat)
(exit)
