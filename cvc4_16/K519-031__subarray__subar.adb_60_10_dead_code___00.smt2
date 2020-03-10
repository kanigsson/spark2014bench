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

(declare-const r11b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r13b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r15b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort k 0)

(declare-fun kqtint (k) Int)

;; k'axiom
  (assert (forall ((i k)) (and (<= 11 (kqtint i)) (<= (kqtint i) 19))))

(define-fun in_range2 ((x Int)) Bool (and (<= 11 x) (<= x 19)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (k k) Bool)

(declare-const dummy1 k)

(declare-datatypes ((k__ref 0))
(((k__refqtmk (k__content k)))))
(define-fun k__ref_k__content__projection ((a k__ref)) k (k__content a))

(define-fun dynamic_invariant1 ((temp___expr_265 Int)
  (temp___is_init_261 Bool) (temp___skip_constant_262 Bool)
  (temp___do_toplevel_263 Bool)
  (temp___do_typ_inv_264 Bool)) Bool (=>
                                     (or (= temp___is_init_261 true)
                                     (<= 11 19)) (in_range2 temp___expr_265)))

(assert
;; defqtvc
 ;; File "subar.adb", line 45, characters 0-0
  (not
  (forall ((x Int))
  (=> (= x 18)
  (=> (dynamic_invariant x true false true true)
  (=> (= x r11b)
  (=> (dynamic_invariant r11b true false true true)
  (let ((temp___288 r11b))
  (forall ((i Int))
  (=> (= i 12)
  (=>
  (or
  (not
  (= (and (ite (<= 12 i) true false) (ite (<= i temp___288) true false)) true))
  (exists ((i1 Int)) (and (and (<= 12 i1) (<= i1 r11b)) (= i1 temp___288))))
  (let ((o (+ x 1)))
  (=> (in_range1 o)
  (forall ((x1 Int))
  (=> (= x1 o)
  (=> (= x1 r13b)
  (=> (dynamic_invariant r13b true false true true)
  (let ((temp___290 r13b))
  (forall ((i1 Int))
  (=> (= i1 20)
  (=>
  (or
  (not
  (= (and (ite (<= 20 i1) true false) (ite (<= i1 temp___290) true false)) true))
  (exists ((i2 Int)) (and (and (<= 20 i2) (<= i2 r13b)) (= i2 temp___290))))
  (let ((o1 (+ x1 1)))
  (=> (in_range1 o1)
  (forall ((x2 Int))
  (=> (= x2 o1)
  (=> (= x2 r15b)
  (=> (dynamic_invariant r15b true false true true)
  (forall ((i2 Int))
  (=> (= i2 19)
  (not
  (= (and (ite (<= 19 i2) true false) (ite (<= i2 r15b) true false)) true)))))))))))))))))))))))))))))))
(check-sat)
(exit)
