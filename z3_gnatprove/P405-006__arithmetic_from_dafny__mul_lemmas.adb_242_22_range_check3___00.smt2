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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort small_integer 0)

(declare-fun small_integerqtint (small_integer) Int)

;; small_integer'axiom
  (assert
  (forall ((i small_integer))
  (and (<= (- 1000) (small_integerqtint i)) (<= (small_integerqtint i) 1000))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 1000) x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (small_integer small_integer) Bool)

(declare-const dummy1 small_integer)

(declare-datatypes ()
((small_integer__ref
 (small_integer__refqtmk (small_integer__content small_integer)))))
(define-fun small_integer__ref_small_integer__content__projection ((a small_integer__ref)) small_integer 
  (small_integer__content a))

(declare-sort small_natural 0)

(declare-fun small_naturalqtint (small_natural) Int)

;; small_natural'axiom
  (assert
  (forall ((i small_natural))
  (and (<= 0 (small_naturalqtint i)) (<= (small_naturalqtint i) 1000))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (small_natural small_natural) Bool)

(declare-const dummy2 small_natural)

(declare-datatypes ()
((small_natural__ref
 (small_natural__refqtmk (small_natural__content small_natural)))))
(define-fun small_natural__ref_small_natural__content__projection ((a small_natural__ref)) small_natural 
  (small_natural__content a))

(declare-sort small_positive 0)

(declare-fun small_positiveqtint (small_positive) Int)

;; small_positive'axiom
  (assert
  (forall ((i small_positive))
  (and (<= 1 (small_positiveqtint i)) (<= (small_positiveqtint i) 1000))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (small_positive small_positive) Bool)

(declare-const dummy3 small_positive)

(declare-datatypes ()
((small_positive__ref
 (small_positive__refqtmk (small_positive__content small_positive)))))
(define-fun small_positive__ref_small_positive__content__projection ((a small_positive__ref)) small_positive 
  (small_positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= (- 1000) 1000)) (in_range1
                                     temp___expr_180)))

(define-fun dynamic_invariant2 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 1000)) (in_range2
                                     temp___expr_187)))

(define-fun dynamic_invariant3 ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= 1 1000)) (in_range3
                                     temp___expr_194)))

(declare-const x Int)

(declare-const y Int)

(declare-const z Int)

(declare-const r Int)

(declare-const s Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant x false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant y false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant z false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant r false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant s false false true true))

(declare-const x1 Int)

;; H
  (assert (= x1 4))

(declare-const y1 Int)

;; H
  (assert (= y1 827))

;; Ensures
  (assert (in_range3 y1))

;; Ensures
  (assert (in_range3 x1))

(declare-const r1 Int)

;; H
  (assert (< 0 r1))

;; H
  (assert (dynamic_invariant r1 true true true true))

(declare-const x2 Int)

;; H
  (assert (= x2 4))

(declare-const y2 Int)

;; H
  (assert (= y2 827))

;; Ensures
  (assert (in_range1 y2))

;; Ensures
  (assert (in_range1 x2))

(declare-const r2 Int)

;; H
  (assert (=> (not (= r2 0)) (and (not (= x2 0)) (not (= y2 0)))))

;; H
  (assert (dynamic_invariant r2 true true true true))

(declare-const x3 Int)

;; H
  (assert (= x3 4))

(declare-const y3 Int)

;; H
  (assert (= y3 827))

(declare-const z1 Int)

;; H
  (assert (= z1 827))

;; Ensures
  (assert (in_range1 z1))

;; Ensures
  (assert (in_range1 y3))

;; Ensures
  (assert (in_range1 x3))

(declare-const r3 Int)

(declare-const s1 Int)

;; H
  (assert (= r3 s1))

;; H
  (assert (dynamic_invariant r3 true true true true))

;; H
  (assert (dynamic_invariant s1 true true true true))

(declare-const x4 Int)

;; H
  (assert (= x4 4))

(declare-const y4 Int)

;; H
  (assert (= y4 827))

(declare-const z2 Int)

;; H
  (assert (= z2 827))

;; Ensures
  (assert (in_range1 z2))

;; Ensures
  (assert (in_range1 y4))

;; Ensures
  (assert (in_range1 x4))

(declare-const r4 Int)

(declare-const s2 Int)

;; H
  (assert (= r4 s2))

;; H
  (assert (dynamic_invariant r4 true true true true))

;; H
  (assert (dynamic_invariant s2 true true true true))

(declare-const x5 Int)

;; H
  (assert (= x5 4))

(declare-const y5 Int)

;; H
  (assert (= y5 827))

;; Ensures
  (assert (in_range3 y5))

;; Ensures
  (assert (in_range3 x5))

(declare-const r5 Int)

;; H
  (assert (<= x5 r5))

;; H
  (assert (<= y5 r5))

;; H
  (assert (dynamic_invariant r5 true true true true))

(declare-const x6 Int)

;; H
  (assert (= x6 4))

(declare-const y6 Int)

;; H
  (assert (= y6 827))

(declare-const z3 Int)

;; H
  (assert (= z3 827))

;; Ensures
  (assert (in_range3 z3))

;; Ensures
  (assert (in_range1 y6))

;; Ensures
  (assert (in_range1 x6))

(declare-const r6 Int)

(declare-const s3 Int)

;; H
  (assert (< r6 s3))

;; H
  (assert (dynamic_invariant r6 true true true true))

;; H
  (assert (dynamic_invariant s3 true true true true))

(declare-const x7 Int)

;; H
  (assert (= x7 4))

(declare-const y7 Int)

;; H
  (assert (= y7 827))

(declare-const z4 Int)

;; H
  (assert (= z4 827))

;; Ensures
  (assert (in_range3 z4))

;; Ensures
  (assert (in_range1 y7))

;; Ensures
  (assert (in_range1 x7))

(declare-const r7 Int)

(declare-const s4 Int)

;; H
  (assert (<= r7 s4))

;; H
  (assert (dynamic_invariant r7 true true true true))

;; H
  (assert (dynamic_invariant s4 true true true true))

(declare-const x8 Int)

;; H
  (assert (= x8 4))

(declare-const y8 Int)

;; H
  (assert (= y8 827))

(define-fun o () Int (+ y8 123))

;; Ensures
  (assert (in_range o))

;; Ensures
  (assert (in_range2 o))

;; Ensures
  (assert (in_range2 y8))

(define-fun o1 () Int (+ x8 34))

;; Ensures
  (assert (in_range o1))

;; Ensures
  (assert (in_range2 o1))

;; Ensures
  (assert (in_range2 x8))

(declare-const r8 Int)

(declare-const s5 Int)

;; H
  (assert (<= r8 s5))

;; H
  (assert (dynamic_invariant r8 true true true true))

;; H
  (assert (dynamic_invariant s5 true true true true))

(declare-const x9 Int)

;; H
  (assert (= x9 4))

(declare-const y9 Int)

;; H
  (assert (= y9 827))

(define-fun o2 () Int (+ y9 123))

;; Ensures
  (assert (in_range o2))

;; Ensures
  (assert (in_range2 o2))

;; Ensures
  (assert (in_range2 y9))

(define-fun o3 () Int (+ x9 34))

;; Ensures
  (assert (in_range o3))

;; Ensures
  (assert (in_range2 o3))

;; Ensures
  (assert (in_range2 x9))

(declare-const r9 Int)

(declare-const s6 Int)

;; H
  (assert (< r9 s6))

;; H
  (assert (dynamic_invariant r9 true true true true))

;; H
  (assert (dynamic_invariant s6 true true true true))

(declare-const x10 Int)

;; H
  (assert (= x10 4))

(declare-const y10 Int)

;; H
  (assert (= y10 827))

(declare-const z5 Int)

;; H
  (assert (= z5 827))

;; Ensures
  (assert (in_range1 z5))

;; Ensures
  (assert (in_range1 y10))

;; Ensures
  (assert (in_range3 x10))

(declare-const r10 Int)

(declare-const s7 Int)

;; H
  (assert (=> (<= y10 z5) (<= r10 s7)))

;; H
  (assert (=> (< y10 z5) (< r10 s7)))

;; H
  (assert (dynamic_invariant r10 true true true true))

;; H
  (assert (dynamic_invariant s7 true true true true))

(declare-const x11 Int)

;; H
  (assert (= x11 4))

(declare-const y11 Int)

;; H
  (assert (= y11 827))

(declare-const z6 Int)

;; H
  (assert (= z6 827))

;; Ensures
  (assert (in_range2 z6))

;; Ensures
  (assert (in_range1 y11))

;; Ensures
  (assert (in_range1 x11))

;; Ensures
  (assert (< x11 y11))

(declare-const x12 Int)

;; H
  (assert (= x12 4))

(declare-const y12 Int)

;; H
  (assert (= y12 827))

(declare-const z7 Int)

;; H
  (assert (= z7 827))

;; Ensures
  (assert (in_range3 z7))

;; Ensures
  (assert (in_range1 y12))

;; Ensures
  (assert (in_range1 x12))

;; Ensures
  (assert (<= x12 y12))

(declare-const x13 Int)

;; H
  (assert (= x13 4))

(declare-const y13 Int)

;; H
  (assert (= y13 4))

(declare-const z8 Int)

;; H
  (assert (= z8 827))

;; Ensures
  (assert (in_range3 z8))

;; Ensures
  (assert (in_range1 y13))

;; Ensures
  (assert (in_range1 x13))

;; Ensures
  (assert (= x13 y13))

(declare-const x14 Int)

;; H
  (assert (= x14 4))

(declare-const y14 Int)

;; H
  (assert (= y14 4))

;; Ensures
  (assert (in_range3 y14))

;; Ensures
  (assert (in_range1 x14))

(declare-const r11 Int)

;; H
  (assert (< y14 r11))

;; H
  (assert (dynamic_invariant r11 true true true true))

(declare-const x15 Int)

;; H
  (assert (= x15 4))

(declare-const y15 Int)

;; H
  (assert (= y15 4))

(assert
;; defqtvc
 ;; File "mul_lemmas.adb", line 3, characters 0-0
  (not (in_range3 y15)))
(check-sat)
