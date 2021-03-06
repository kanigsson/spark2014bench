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

(declare-fun power (Int Int) Int)

;; Power_0
  (assert (forall ((x Int)) (= (power x 0) 1)))

;; Power_s
  (assert
  (forall ((x Int) (n Int))
  (=> (<= 0 n) (= (power x (+ n 1)) (* x (power x n))))))

;; Power_s_alt
  (assert
  (forall ((x Int) (n Int))
  (=> (< 0 n) (= (power x n) (* x (power x (- n 1)))))))

;; Power_1
  (assert (forall ((x Int)) (= (power x 1) x)))

;; Power_sum
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n)
  (=> (<= 0 m) (= (power x (+ n m)) (* (power x n) (power x m)))))))

;; Power_mult
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_comm1
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int)) (=> (<= 0 n) (= (* (power x n) y) (* y (power x n))))))))

;; Power_comm2
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int))
  (=> (<= 0 n) (= (power (* x y) n) (* (power x n) (power y n))))))))

;; Power_non_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (<= 0 y)) (<= 0 (power x y)))))

;; Power_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (< 0 x) (<= 0 y)) (< 0 (power x y)))))

;; Power_monotonic
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (and (< 0 x) (and (<= 0 n) (<= n m))) (<= (power x n) (power x m)))))

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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const x1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort very_small_natural 0)

(declare-fun very_small_naturalqtint (very_small_natural) Int)

;; very_small_natural'axiom
  (assert
  (forall ((i very_small_natural))
  (and (<= 0 (very_small_naturalqtint i))
  (<= (very_small_naturalqtint i) 50))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 50)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (very_small_natural very_small_natural) Bool)

(declare-const dummy1 very_small_natural)

(declare-datatypes ()
((very_small_natural__ref
 (very_small_natural__refqtmk
 (very_small_natural__content very_small_natural)))))
(define-fun very_small_natural__ref_very_small_natural__content__projection ((a very_small_natural__ref)) very_small_natural 
  (very_small_natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_232 Int)
  (temp___is_init_228 Bool) (temp___skip_constant_229 Bool)
  (temp___do_toplevel_230 Bool)
  (temp___do_typ_inv_231 Bool)) Bool (=>
                                     (or (= temp___is_init_228 true)
                                     (<= 0 50)) (in_range1 temp___expr_232)))

(declare-sort very_very_small_natural 0)

(declare-fun very_very_small_naturalqtint (very_very_small_natural) Int)

;; very_very_small_natural'axiom
  (assert
  (forall ((i very_very_small_natural))
  (and (<= 0 (very_very_small_naturalqtint i))
  (<= (very_very_small_naturalqtint i) 5))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (very_very_small_natural very_very_small_natural) Bool)

(declare-const dummy2 very_very_small_natural)

(declare-datatypes ()
((very_very_small_natural__ref
 (very_very_small_natural__refqtmk
 (very_very_small_natural__content very_very_small_natural)))))
(define-fun very_very_small_natural__ref_very_very_small_natural__content__projection ((a very_very_small_natural__ref)) very_very_small_natural 
  (very_very_small_natural__content a))

(define-fun dynamic_invariant2 ((temp___expr_246 Int)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (=>
                                     (or (= temp___is_init_242 true)
                                     (<= 0 5)) (in_range2 temp___expr_246)))

(declare-const r1 Int)

(declare-const r2 Int)

;; Assume
  (assert (dynamic_invariant1 x1 true false true true))

;; Assume
  (assert (dynamic_invariant1 x2 true false true true))

;; Assume
  (assert (dynamic_invariant2 e true false true true))

;; Assume
  (assert (dynamic_invariant r1 false false true true))

;; Assume
  (assert (dynamic_invariant r2 false false true true))

;; Assume
  (assert (< x1 x2))

(define-fun o () Int (power x1 e))

;; Ensures
  (assert (in_range o))

(declare-const r11 Int)

;; H
  (assert (= r11 o))

(define-fun o1 () Int (power x2 e))

;; Ensures
  (assert (in_range o1))

(declare-const r21 Int)

;; H
  (assert (= r21 o1))

(define-fun o2 () Int e)

(define-fun o3 () Int x2)

(define-fun o4 () Int x1)

;; Ensures
  (assert (<= (power o4 o2) (power o3 o2)))

(assert
;; defqtvc
 ;; File "test_arith.adb", line 180, characters 0-0
  (not (<= r11 r21)))
(check-sat)

(exit)
