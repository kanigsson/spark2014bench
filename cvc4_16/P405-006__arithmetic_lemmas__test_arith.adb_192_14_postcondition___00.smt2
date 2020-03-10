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

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const e1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const e2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort very_small_positive 0)

(declare-fun very_small_positiveqtint (very_small_positive) Int)

;; very_small_positive'axiom
  (assert
  (forall ((i very_small_positive))
  (and (<= 1 (very_small_positiveqtint i))
  (<= (very_small_positiveqtint i) 50))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 50)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (very_small_positive very_small_positive) Bool)

(declare-const dummy1 very_small_positive)

(declare-datatypes ((very_small_positive__ref 0))
(((very_small_positive__refqtmk
  (very_small_positive__content very_small_positive)))))
(define-fun very_small_positive__ref_very_small_positive__content__projection ((a very_small_positive__ref)) very_small_positive 
  (very_small_positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_239 Int)
  (temp___is_init_235 Bool) (temp___skip_constant_236 Bool)
  (temp___do_toplevel_237 Bool)
  (temp___do_typ_inv_238 Bool)) Bool (=>
                                     (or (= temp___is_init_235 true)
                                     (<= 1 50)) (in_range1 temp___expr_239)))

(declare-sort very_very_small_natural 0)

(declare-fun very_very_small_naturalqtint (very_very_small_natural) Int)

;; very_very_small_natural'axiom
  (assert
  (forall ((i very_very_small_natural))
  (and (<= 0 (very_very_small_naturalqtint i))
  (<= (very_very_small_naturalqtint i) 5))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (very_very_small_natural very_very_small_natural) Bool)

(declare-const dummy2 very_very_small_natural)

(declare-datatypes ((very_very_small_natural__ref 0))
(((very_very_small_natural__refqtmk
  (very_very_small_natural__content very_very_small_natural)))))
(define-fun very_very_small_natural__ref_very_very_small_natural__content__projection ((a very_very_small_natural__ref)) very_very_small_natural 
  (very_very_small_natural__content a))

(define-fun dynamic_invariant2 ((temp___expr_246 Int)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (=>
                                     (or (= temp___is_init_242 true)
                                     (<= 0 5)) (in_range2 temp___expr_246)))

(assert
;; defqtvc
 ;; File "test_arith.adb", line 190, characters 0-0
  (not
  (forall ((r1 Int) (r2 Int))
  (=> (dynamic_invariant1 x true false true true)
  (=> (dynamic_invariant2 e1 true false true true)
  (=> (dynamic_invariant2 e2 true false true true)
  (=> (dynamic_invariant r1 false false true true)
  (=> (dynamic_invariant r2 false false true true)
  (=> (< e1 e2)
  (let ((o (power x e1)))
  (=> (in_range o)
  (forall ((r11 Int))
  (=> (= r11 o)
  (let ((o1 (power x e2)))
  (=> (in_range o1)
  (forall ((r21 Int))
  (=> (= r21 o1)
  (let ((o2 x)) (=> (<= (power o2 e1) (power o2 e2)) (<= r11 r21))))))))))))))))))))
(check-sat)
(exit)
