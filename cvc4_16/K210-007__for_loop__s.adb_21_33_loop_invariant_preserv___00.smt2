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

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort t8b 0)

(declare-fun t8bqtint (t8b) Int)

;; t8b'axiom
  (assert (forall ((i t8b)) (and (<= 1 (t8bqtint i)) (<= (t8bqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (t8b t8b) Bool)

(declare-const dummy1 t8b)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content t8b)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) t8b (t8b__content
                                                                 a))

(declare-sort t9b 0)

(declare-fun t9bqtint (t9b) Int)

;; t9b'axiom
  (assert (forall ((i t9b)) (and (<= 1 (t9bqtint i)) (<= (t9bqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t9b t9b) Bool)

(declare-const dummy2 t9b)

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content t9b)))))
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) t9b (t9b__content
                                                                 a))

(assert
;; defqtvc
 ;; File "s.ads", line 11, characters 0-0
  (not
  (forall ((t Int) (index Int) (t1 Int) (index1 Int) (t2 Int) (index2 Int))
  (=> (= t 0)
  (=> (dynamic_invariant t true false true true)
  (=> (= index 1)
  (=>
  (= (and (ite (<= 1 index) true false) (ite (<= index 10) true false)) true)
  (=> (= t1 (- index1 1))
  (=>
  (= (and (ite (and (in_range2 index1) (dynamic_invariant t1 true true true
               true))
          true false) (ite (and (<= 1 index1) (<= index1 10)) true false)) true)
  (=> (= t2 index1)
  (=> (not (= index1 10)) (=> (= index2 (+ index1 1)) (= t2 (- index2 1))))))))))))))
(check-sat)
(exit)
