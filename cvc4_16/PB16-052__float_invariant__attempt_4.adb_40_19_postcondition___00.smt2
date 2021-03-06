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
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(define-fun is_plus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float64)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float64)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 9007199254740992) i)
                                             (<= i 9007199254740992)))

(define-fun same_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float64) (x Float64)
  (y Float64)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float64)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float64)))))
(declare-fun invariant__ (Int Float64 Float64) Bool)

(declare-fun invariant____function_guard (Bool Int Float64 Float64) Bool)

(declare-const max_speed_variance Float64)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort float64 0)

(declare-fun user_eq (float64 float64) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float64)

(declare-const dummy float64)

(declare-datatypes ((float64__ref 0))
(((float64__refqtmk (float64__content float64)))))
(define-fun float64__ref_float64__content__projection ((a float64__ref)) float64 
  (float64__content a))

(define-fun dynamic_invariant ((temp___expr_159 Float64)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                     (fp.isFinite64 temp___expr_159)))

(declare-sort frame 0)

(declare-fun frameqtint (frame) Int)

;; frame'axiom
  (assert
  (forall ((i frame)) (and (<= 0 (frameqtint i)) (<= (frameqtint i) 25000))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 25000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (frame frame) Bool)

(declare-const dummy1 frame)

(declare-datatypes ((frame__ref 0))
(((frame__refqtmk (frame__content frame)))))
(define-fun frame__ref_frame__content__projection ((a frame__ref)) frame 
  (frame__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 25000)) (in_range
                                     temp___expr_166)))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((n Int))
  (forall ((speed Float64) (distance Float64))
  (! (= (= (invariant__ n speed distance) true)
     (and
     (and
     (fp.leq (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) speed)
     (fp.leq speed (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) max_speed_variance)))
     (and
     (fp.leq (fp.mul RNE (fp.mul RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) ((_ to_fp 11 53) RNE (to_real (+ n 1)))) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) (fp #b0 #b01111111110 #b0000000000000000000000000000000000000000000000000000)) distance)
     (fp.leq distance (fp.mul RNE (fp.mul RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) ((_ to_fp 11 53) RNE (to_real (+ n 1)))) 
     max_speed_variance) (fp #b0 #b01111111110 #b0000000000000000000000000000000000000000000000000000)))))) :pattern (
  (invariant__ n speed distance)) ))))

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const factor Float64)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const old_speed Float64)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort tfloat64B 0)

(declare-fun user_eq2 (tfloat64B tfloat64B) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float64)

(declare-const dummy2 tfloat64B)

(declare-datatypes ((tfloat64B__ref 0))
(((tfloat64B__refqtmk (tfloat64B__content tfloat64B)))))
(define-fun tfloat64B__ref_tfloat64B__content__projection ((a tfloat64B__ref)) tfloat64B 
  (tfloat64B__content a))

(declare-sort ratio_t 0)

(define-fun in_range1 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq3 (ratio_t ratio_t) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float64)

(declare-const dummy3 ratio_t)

(declare-datatypes ((ratio_t__ref 0))
(((ratio_t__refqtmk (ratio_t__content ratio_t)))))
(define-fun ratio_t__ref_ratio_t__content__projection ((a ratio_t__ref)) ratio_t 
  (ratio_t__content a))

(define-fun dynamic_invariant2 ((temp___expr_173 Float64)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))
                                     (in_range1 temp___expr_173)))

;; max_speed_variance__def_axiom
  (assert
  (= max_speed_variance (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)))

(assert
;; defqtvc
 ;; File "attempt_4.adb", line 32, characters 0-0
  (not
  (forall ((speed Float64) (distance Float64) (average Float64))
  (=> (dynamic_invariant1 n true false true true)
  (=> (dynamic_invariant2 factor true false true true)
  (=> (dynamic_invariant speed true false true true)
  (=> (dynamic_invariant distance true false true true)
  (=> (dynamic_invariant average false false true true)
  (=> (< n 25000)
  (=>
  (forall ((speed1 Float64) (distance1 Float64)) (invariant____function_guard
  (invariant__ n speed1 distance1) n speed1 distance1))
  (=> (= (invariant__ n speed distance) true)
  (=> (= speed old_speed)
  (=> (dynamic_invariant old_speed true false true true)
  (let ((o (fp.add RNE speed (fp.mul RNE (fp.mul RNE factor (fp #b0 #b10000000010 #b0011100111010000000100111010100100101010001100000101)) (fp #b0 #b01111111000 #b0100011110101110000101000111101011100001010001111011)))))
  (=> (fp.isFinite64 o)
  (forall ((speed1 Float64))
  (=> (= speed1 o)
  (let ((o1 (fp.add RNE old_speed speed1)))
  (=> (fp.isFinite64 o1)
  (forall ((average1 Float64))
  (=>
  (= average1 (fp.div RNE o1 (fp #b0 #b10000000000 #b0000000000000000000000000000000000000000000000000000)))
  (let ((o2 (fp.add RNE distance (fp.mul RNE average1 (fp #b0 #b01111111000 #b0100011110101110000101000111101011100001010001111011)))))
  (=> (fp.isFinite64 o2)
  (forall ((distance1 Float64))
  (=> (= distance1 o2)
  (=>
  (forall ((speed2 Float64) (distance2 Float64)) (invariant____function_guard
  (invariant__ (+ n 1) speed2 distance2) (+ n 1) speed2 distance2))
  (= (invariant__ (+ n 1) speed1 distance1) true)))))))))))))))))))))))))))
(check-sat)
(exit)
