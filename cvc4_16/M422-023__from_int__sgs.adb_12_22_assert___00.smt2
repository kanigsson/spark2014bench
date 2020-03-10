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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
(declare-const x1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const x4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun a (Int) Float32)

(declare-fun a__function_guard (Float32 Int) Bool)

(declare-fun c (Int) Float32)

(declare-fun c__function_guard (Float32 Int) Bool)

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__2__projection ((a1 float____ref)) float__ 
  (float____content a1))

(define-fun dynamic_invariant ((temp___expr_160 Float32)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_160)))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert (forall ((i t)) (and (<= 0 (tqtint i)) (<= (tqtint i) 14))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 14)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t t) Bool)

(declare-const dummy1 t)

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 t)))))
(define-fun t__ref_t__content__projection ((a1 t__ref1)) t (t__content1 a1))

(define-fun dynamic_invariant1 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 0 14)) (in_range temp___expr_167)))

;; a__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (a x)))
     (=> (a__function_guard result x)
     (and
     (and (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) result)
     (fp.leq result (fp #b0 #b10000010 #b11000000000000000000000)))
     (dynamic_invariant result true false true true))))) :pattern ((a x)) )))

;; a__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true)
     (and (forall ((x5 Int)) (c__function_guard (c x5) x5)) (= (a x) (c x)))) :pattern (
  (a x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort u 0)

(define-fun in_range1 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b10000010 #b11000000000000000000000)))))

(declare-fun user_eq2 (u u) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy2 u)

(declare-datatypes ((u__ref 0))
(((u__refqtmk (u__content u)))))
(define-fun u__ref_u__content__projection ((a1 u__ref)) u (u__content a1))

(define-fun dynamic_invariant2 ((temp___expr_174 Float32)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) (fp #b0 #b10000010 #b11000000000000000000000)))
                                     (in_range1 temp___expr_174)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a1 integer__ref)) integer 
  (integer__content a1))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

;; c__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant3 x true true true true)
     (let ((result (c x)))
     (=> (c__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((c x)) )))

;; c__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant3 x true true true true)
     (= (c x) ((_ to_fp 8 24) RNE (to_real x)))) :pattern ((c x)) )))

(assert
;; defqtvc
 ;; File "sgs.ads", line 10, characters 0-0
  (not
  (forall ((r1 Float32) (r2 Float32))
  (=> (dynamic_invariant1 x1 true false true true)
  (=> (dynamic_invariant1 x2 true false true true)
  (=> (dynamic_invariant1 x3 true false true true)
  (=> (dynamic_invariant1 x4 true false true true)
  (=> (dynamic_invariant r1 false false true true)
  (=> (dynamic_invariant2 r2 false false true true)
  (=> (a__function_guard (a x1) x1)
  (=> (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) (a x1))
  (=> (a__function_guard (a x1) x1)
  (=> (fp.leq (a x1) (fp #b0 #b10000010 #b11000000000000000000000))
  (=> (a__function_guard (a x2) x2)
  (fp.leq (a x2) (fp #b0 #b10000010 #b11000000000000000000000))))))))))))))))
(check-sat)
(exit)
