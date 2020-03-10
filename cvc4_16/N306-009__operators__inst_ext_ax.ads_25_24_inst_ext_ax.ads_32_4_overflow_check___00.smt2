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

(declare-fun addthree (Int Int Int) Int)

(declare-fun addthree__function_guard (Int Int Int Int) Bool)

(declare-sort int200 0)

(declare-fun int200qtint (int200) Int)

;; int200'axiom
  (assert
  (forall ((i int200)) (and (<= 0 (int200qtint i)) (<= (int200qtint i) 200))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 200)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (int200 int200) Bool)

(declare-const dummy1 int200)

(declare-datatypes ((int200__ref 0))
(((int200__refqtmk (int200__content int200)))))
(define-fun int200__ref_int200__content__projection ((a int200__ref)) int200 
  (int200__content a))

(define-fun dynamic_invariant1 ((temp___expr_1009 Int)
  (temp___is_init_1005 Bool) (temp___skip_constant_1006 Bool)
  (temp___do_toplevel_1007 Bool)
  (temp___do_typ_inv_1008 Bool)) Bool (=>
                                      (or (= temp___is_init_1005 true)
                                      (<= 0 200)) (in_range1
                                      temp___expr_1009)))

;; addthree__post_axiom
  (assert
  (forall ((a Int) (b Int) (c Int))
  (! (=>
     (and
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant1 b
     true true true true)) (dynamic_invariant1 c true true true true))
     (let ((result (addthree a b c)))
     (=> (addthree__function_guard result a b c) (dynamic_invariant result
     true false true true)))) :pattern ((addthree a b c)) )))

;; addthree__def_axiom
  (assert
  (forall ((a Int) (b Int) (c Int))
  (! (=>
     (and
     (and (dynamic_invariant1 a true true true true) (dynamic_invariant1 b
     true true true true)) (dynamic_invariant1 c true true true true))
     (= (addthree a b c) (+ (+ a b) c))) :pattern ((addthree a b c)) )))

(declare-const i1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort int100 0)

(declare-fun int100qtint (int100) Int)

;; int100'axiom
  (assert
  (forall ((i int100)) (and (<= 0 (int100qtint i)) (<= (int100qtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (int100 int100) Bool)

(declare-const dummy2 int100)

(declare-datatypes ((int100__ref 0))
(((int100__refqtmk (int100__content int100)))))
(define-fun int100__ref_int100__content__projection ((a int100__ref)) int100 
  (int100__content a))

(define-fun dynamic_invariant2 ((temp___expr_1002 Int)
  (temp___is_init_998 Bool) (temp___skip_constant_999 Bool)
  (temp___do_toplevel_1000 Bool)
  (temp___do_typ_inv_1001 Bool)) Bool (=>
                                      (or (= temp___is_init_998 true)
                                      (<= 0 100)) (in_range2
                                      temp___expr_1002)))

(assert
;; defqtvc
 ;; File "inst_ext_ax.ads", line 24, characters 0-0
  (not
  (=> (dynamic_invariant2 i1 true false true true)
  (=> (dynamic_invariant2 i2 true false true true)
  (let ((o i1))
  (let ((o1 i2))
  (let ((o2 i1))
  (let ((o3 (addthree o2 o1 o)))
  (=>
  (and (addthree__function_guard o3 o2 o1 o)
  (and (dynamic_invariant o3 true false true true) (= o3 (+ (+ o2 o1) o))))
  (in_range (+ (+ i1 i2) o3)))))))))))
(check-sat)
(exit)
