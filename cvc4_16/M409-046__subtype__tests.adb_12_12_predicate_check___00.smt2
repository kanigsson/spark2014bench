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

(declare-const i3s Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort positive_but_not_ten 0)

(declare-fun positive_but_not_tenqtint (positive_but_not_ten) Int)

;; positive_but_not_ten'axiom
  (assert
  (forall ((i positive_but_not_ten))
  (and (<= 1 (positive_but_not_tenqtint i))
  (<= (positive_but_not_tenqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive_but_not_ten positive_but_not_ten) Bool)

(declare-const dummy positive_but_not_ten)

(declare-datatypes ((positive_but_not_ten__ref 0))
(((positive_but_not_ten__refqtmk
  (positive_but_not_ten__content positive_but_not_ten)))))
(define-fun positive_but_not_ten__ref_positive_but_not_ten__content__projection ((a positive_but_not_ten__ref)) positive_but_not_ten 
  (positive_but_not_ten__content a))

(define-fun dynamic_invariant ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 1 2147483647)) (in_range
                                     temp___expr_179))
                                     (=> (= temp___do_toplevel_177 true)
                                     (=> (= temp___is_init_175 true)
                                     (or
                                     (and (<= 1 temp___expr_179)
                                     (<= temp___expr_179 9))
                                     (and (<= 11 temp___expr_179)
                                     (<= temp___expr_179 2147483647)))))))

(define-fun dynamic_predicate ((temp___183 Int)) Bool (or
                                                      (and (<= 1 temp___183)
                                                      (<= temp___183 9))
                                                      (and (<= 11 temp___183)
                                                      (<= temp___183 2147483647))))

(assert
;; defqtvc
 ;; File "tests.ads", line 6, characters 0-0
  (not
  (forall ((v Int))
  (=> (dynamic_invariant i3s true false true true)
  (=> (dynamic_invariant i3s true false true true)
  (=> (dynamic_invariant v true false true true)
  (=> (not (= v 10))
  (or (and (<= 1 10) (<= 10 9)) (and (<= 11 10) (<= 10 2147483647))))))))))
(check-sat)
(exit)
