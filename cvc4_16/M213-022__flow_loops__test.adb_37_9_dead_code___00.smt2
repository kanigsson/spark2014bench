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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(assert
;; defqtvc
 ;; File "test.adb", line 25, characters 0-0
  (not
  (forall ((x Int))
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (not
  (exists ((x1 Int))
  (and (dynamic_invariant x1 true true true true)
  (exists ((x2 Int))
  (and (= x2 0)
  (exists ((i Int))
  (and (= i 0)
  (exists ((x3 Int))
  (and (= x3 i)
  (or (< y x3)
  (exists ((i1 Int))
  (and (= i1 1)
  (exists ((x4 Int))
  (and (= x4 i1)
  (or (< y x4)
  (exists ((i2 Int))
  (and (= i2 2)
  (exists ((x5 Int))
  (and (= x5 i2)
  (or (< y x5)
  (exists ((i3 Int))
  (and (= i3 3)
  (exists ((x6 Int))
  (and (= x6 i3)
  (or (< y x6)
  (exists ((i4 Int))
  (and (= i4 4)
  (exists ((x7 Int))
  (and (= x7 i4)
  (or (< y x7)
  (exists ((i5 Int))
  (and (= i5 5)
  (exists ((x8 Int))
  (and (= x8 i5)
  (or (< y x8)
  (exists ((i6 Int))
  (and (= i6 6)
  (exists ((x9 Int))
  (and (= x9 i6)
  (or (< y x9)
  (exists ((i7 Int))
  (and (= i7 7)
  (exists ((x10 Int))
  (and (= x10 i7)
  (or (< y x10)
  (exists ((i8 Int))
  (and (= i8 8)
  (exists ((x11 Int))
  (and (= x11 i8)
  (or (< y x11)
  (exists ((i9 Int))
  (and (= i9 9)
  (exists ((x12 Int))
  (and (= x12 i9)
  (or (< y x12)
  (exists ((i10 Int))
  (and (= i10 10) (exists ((x13 Int)) (and (= x13 i10) (< y x13)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
