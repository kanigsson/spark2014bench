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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(assert
;; defqtvc
 ;; File "loopvariant.adb", line 3, characters 0-0
  (not
  (forall ((spark__branch Bool) (i Int) (j Int) (i1 Int) (j1 Int)
  (spark__branch1 Bool) (i2 Int) (j2 Int) (i3 Int) (j3 Int)
  (spark__branch2 Bool) (i4 Int) (j4 Int) (i5 Int) (j5 Int) (temp___182 Int)
  (temp___181 Int) (i6 Int) (j6 Int))
  (=> (dynamic_invariant i false false true true)
  (=> (dynamic_invariant j false false true true)
  (=> (= i1 1)
  (=> (= j1 3)
  (=>
  (ite (< i1 3)
  (exists ((spark__branch3 Bool) (i7 Int) (j7 Int))
  (and
  (and (= spark__branch3 (ite (< 0 j1) true false))
  (ite (= spark__branch3 true)
  (and (let ((o (- j1 1))) (and (in_range1 o) (= j7 o))) (= i7 i1))
  (and (= j7 3) (let ((o (+ i1 1))) (and (in_range1 o) (= i7 o))))))
  (and
  (and (dynamic_invariant i2 false true true true) (dynamic_invariant j2
  false true true true))
  (exists ((temp___178 Int))
  (and (= temp___178 i2)
  (exists ((temp___177 Int)) (and (= temp___177 j2) (not (< i2 3)))))))))
  (and (and (= spark__branch1 spark__branch) (= i2 i1)) (= j2 j1)))
  (=> (= i3 1)
  (=> (= j3 3)
  (=> (< i3 3)
  (=> (= spark__branch2 (ite (< 0 j3) true false))
  (=>
  (ite (= spark__branch2 true)
  (and (let ((o (- j3 1))) (and (in_range1 o) (= j4 o))) (= i4 i3))
  (and (= j4 3) (let ((o (- i3 1))) (and (in_range1 o) (= i4 o)))))
  (=> (dynamic_invariant i5 false true true true)
  (=> (dynamic_invariant j5 false true true true)
  (=> (= temp___182 i5)
  (=> (= temp___181 j5)
  (=> (= (and (ite (<= 0 i5) true false) (ite (<= i5 3) true false)) true)
  (=> (< i5 3)
  (=>
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (< 0 j5) true false))
  (ite (= spark__branch3 true)
  (and (let ((o (- j5 1))) (and (in_range1 o) (= j6 o))) (= i6 i5))
  (and (= j6 3) (let ((o (- i5 1))) (and (in_range1 o) (= i6 o)))))))
  (or (< temp___182 i6) (and (= i6 temp___182) (< j6 temp___181)))))))))))))))))))))))
(check-sat)
(exit)
