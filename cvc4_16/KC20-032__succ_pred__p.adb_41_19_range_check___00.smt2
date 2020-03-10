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

(declare-const m Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tmoneyB 0)

(define-fun in_range ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                    (<= x 9223372036854775807)))

(declare-const dummy tmoneyB)

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (tmoneyB tmoneyB) Bool)

(declare-datatypes ((tmoneyB__ref 0))
(((tmoneyB__refqtmk (tmoneyB__content tmoneyB)))))
(define-fun tmoneyB__ref_tmoneyB__content__projection ((a tmoneyB__ref)) tmoneyB 
  (tmoneyB__content a))

(declare-sort money 0)

(define-fun in_range1 ((x Int)) Bool (and (<= (- 999999999999999) x)
                                     (<= x 999999999999999)))

(declare-const dummy1 money)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (money money) Bool)

(declare-datatypes ((money__ref 0))
(((money__refqtmk (money__content money)))))
(define-fun money__ref_money__content__projection ((a money__ref)) money 
  (money__content a))

(define-fun dynamic_invariant ((temp___expr_198 Int)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (=>
                                     (or (= temp___is_init_194 true)
                                     (<= (- 999999999999999) 999999999999999))
                                     (in_range1 temp___expr_198)))

(assert
;; defqtvc
 ;; File "p.adb", line 35, characters 0-0
  (not
  (=> (dynamic_invariant m true false true true)
  (=> (not (= m 999999999999999)) (in_range1 (- (+ m 1) 1))))))
(check-sat)
(exit)
