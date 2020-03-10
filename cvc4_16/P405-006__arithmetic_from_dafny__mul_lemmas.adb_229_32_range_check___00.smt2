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

(declare-datatypes ((small_integer__ref 0))
(((small_integer__refqtmk (small_integer__content small_integer)))))
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

(declare-datatypes ((small_natural__ref 0))
(((small_natural__refqtmk (small_natural__content small_natural)))))
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

(declare-datatypes ((small_positive__ref 0))
(((small_positive__refqtmk (small_positive__content small_positive)))))
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

(assert
;; defqtvc
 ;; File "mul_lemmas.adb", line 3, characters 0-0
  (not
  (forall ((x Int) (y Int) (z Int) (r Int) (s Int) (x1 Int) (y1 Int) (r1 Int)
  (x2 Int) (y2 Int) (r2 Int) (x3 Int) (y3 Int) (z1 Int) (r3 Int) (s1 Int)
  (x4 Int) (y4 Int) (z2 Int) (r4 Int) (s2 Int) (x5 Int) (y5 Int) (r5 Int)
  (x6 Int) (y6 Int) (z3 Int) (r6 Int) (s3 Int) (x7 Int) (y7 Int) (z4 Int)
  (r7 Int) (s4 Int) (x8 Int) (y8 Int))
  (=> (dynamic_invariant x false false true true)
  (=> (dynamic_invariant y false false true true)
  (=> (dynamic_invariant z false false true true)
  (=> (dynamic_invariant r false false true true)
  (=> (dynamic_invariant s false false true true)
  (=> (= x1 4)
  (=> (= y1 827)
  (=> (in_range3 y1)
  (=> (in_range3 x1)
  (=> (< 0 r1)
  (=> (dynamic_invariant r1 true true true true)
  (=> (= x2 4)
  (=> (= y2 827)
  (=> (in_range1 y2)
  (=> (in_range1 x2)
  (=> (=> (not (= r2 0)) (and (not (= x2 0)) (not (= y2 0))))
  (=> (dynamic_invariant r2 true true true true)
  (=> (= x3 4)
  (=> (= y3 827)
  (=> (= z1 827)
  (=> (in_range1 z1)
  (=> (in_range1 y3)
  (=> (in_range1 x3)
  (=> (= r3 s1)
  (=> (dynamic_invariant r3 true true true true)
  (=> (dynamic_invariant s1 true true true true)
  (=> (= x4 4)
  (=> (= y4 827)
  (=> (= z2 827)
  (=> (in_range1 z2)
  (=> (in_range1 y4)
  (=> (in_range1 x4)
  (=> (= r4 s2)
  (=> (dynamic_invariant r4 true true true true)
  (=> (dynamic_invariant s2 true true true true)
  (=> (= x5 4)
  (=> (= y5 827)
  (=> (in_range3 y5)
  (=> (in_range3 x5)
  (=> (<= x5 r5)
  (=> (<= y5 r5)
  (=> (dynamic_invariant r5 true true true true)
  (=> (= x6 4)
  (=> (= y6 827)
  (=> (= z3 827)
  (=> (in_range3 z3)
  (=> (in_range1 y6)
  (=> (in_range1 x6)
  (=> (< r6 s3)
  (=> (dynamic_invariant r6 true true true true)
  (=> (dynamic_invariant s3 true true true true)
  (=> (= x7 4)
  (=> (= y7 827)
  (=> (= z4 827)
  (=> (in_range3 z4)
  (=> (in_range1 y7)
  (=> (in_range1 x7)
  (=> (<= r7 s4)
  (=> (dynamic_invariant r7 true true true true)
  (=> (dynamic_invariant s4 true true true true)
  (=> (= x8 4)
  (=> (= y8 827)
  (let ((o (+ y8 123)))
  (=> (in_range o)
  (=> (in_range2 o)
  (=> (in_range2 y8)
  (let ((o1 (+ x8 34)))
  (=> (in_range o1)
  (=> (in_range2 o1)
  (=> (in_range2 x8)
  (forall ((r8 Int) (s5 Int))
  (=>
  (and (<= r8 s5)
  (and (dynamic_invariant r8 true true true true) (dynamic_invariant s5 true
  true true true)))
  (forall ((x9 Int))
  (=> (= x9 4)
  (forall ((y9 Int))
  (=> (= y9 827)
  (let ((o2 (+ y9 123)))
  (=> (in_range o2)
  (=> (in_range2 o2)
  (=> (in_range2 y9)
  (let ((o3 (+ x9 34)))
  (=> (in_range o3)
  (=> (in_range2 o3)
  (=> (in_range2 x9)
  (forall ((r9 Int) (s6 Int))
  (=>
  (and (< r9 s6)
  (and (dynamic_invariant r9 true true true true) (dynamic_invariant s6 true
  true true true)))
  (forall ((x10 Int))
  (=> (= x10 4)
  (forall ((y10 Int))
  (=> (= y10 827)
  (forall ((z5 Int))
  (=> (= z5 827)
  (=> (in_range1 z5)
  (=> (in_range1 y10)
  (=> (in_range3 x10)
  (forall ((r10 Int) (s7 Int))
  (=>
  (and (and (=> (<= y10 z5) (<= r10 s7)) (=> (< y10 z5) (< r10 s7)))
  (and (dynamic_invariant r10 true true true true) (dynamic_invariant s7 true
  true true true)))
  (forall ((x11 Int))
  (=> (= x11 4)
  (forall ((y11 Int))
  (=> (= y11 827)
  (forall ((z6 Int))
  (=> (= z6 827)
  (=> (in_range2 z6)
  (=> (in_range1 y11)
  (=> (in_range1 x11)
  (=> (< x11 y11)
  (forall ((x12 Int))
  (=> (= x12 4)
  (forall ((y12 Int))
  (=> (= y12 827)
  (forall ((z7 Int)) (=> (= z7 827) (=> (in_range3 z7) (in_range1 y12))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
