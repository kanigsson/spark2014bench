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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float64)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float64)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float64)

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

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float64)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-fun low_bound (Int) Float64)

(declare-fun low_bound__function_guard (Float64 Int) Bool)

(declare-sort float64 0)

(declare-fun user_eq (float64 float64) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float64)

(declare-const dummy float64)

(declare-datatypes ()
((float64__ref (float64__refqtmk (float64__content float64)))))
(define-fun float64__ref_float64__content__projection ((a float64__ref)) float64 
  (float64__content a))

(define-fun dynamic_invariant ((temp___expr_162 Float64)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                     (fp.isFinite64 temp___expr_162)))

(declare-sort frame 0)

(declare-fun frameqtint (frame) Int)

;; frame'axiom
  (assert
  (forall ((i frame)) (and (<= 0 (frameqtint i)) (<= (frameqtint i) 25000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 25000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (frame frame) Bool)

(declare-const dummy1 frame)

(declare-datatypes () ((frame__ref (frame__refqtmk (frame__content frame)))))
(define-fun frame__ref_frame__content__projection ((a frame__ref)) frame 
  (frame__content a))

(define-fun dynamic_invariant1 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 25000)) (in_range1
                                     temp___expr_169)))

;; low_bound__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true)
     (let ((result (low_bound n)))
     (=> (low_bound__function_guard result n) (dynamic_invariant result true
     false true true)))) :pattern ((low_bound n)) )))

;; low_bound__def_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true)
     (= (low_bound n) (fp.mul RNE (of_int RNE n) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))) :pattern (
  (low_bound n)) )))

(declare-fun high_bound (Int) Float64)

(declare-fun high_bound__function_guard (Float64 Int) Bool)

;; high_bound__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true)
     (let ((result (high_bound n)))
     (=> (high_bound__function_guard result n) (dynamic_invariant result true
     false true true)))) :pattern ((high_bound n)) )))

;; high_bound__def_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true)
     (= (high_bound n) (fp.mul RNE (of_int RNE n) (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)))) :pattern (
  (high_bound n)) )))

(declare-fun invariant__ (Int Float64) Bool)

(declare-fun invariant____function_guard (Bool Int Float64) Bool)

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((n Int))
  (forall ((speed Float64))
  (! (and (forall ((n1 Int)) (low_bound__function_guard (low_bound n1) n1))
     (and (forall ((n1 Int)) (high_bound__function_guard (high_bound n1) n1))
     (= (= (invariant__ n speed) true)
     (and (fp.leq (low_bound n) speed) (fp.leq speed (high_bound n)))))) :pattern (
  (invariant__ n speed)) ))))

(declare-fun in_bounds (Float64) Bool)

(declare-fun in_bounds__function_guard (Bool Float64) Bool)

;; in_bounds__post_axiom
  (assert true)

;; in_bounds__def_axiom
  (assert
  (forall ((v Float64))
  (! (= (= (in_bounds v) true)
     (and
     (fp.leq (fp.neg (fp #b0 #b10000010011 #b1000110010111010100000000000000000000000000000000000)) v)
     (fp.leq v (fp #b0 #b10000010011 #b1000110010111010100000000000000000000000000000000000)))) :pattern (
  (in_bounds v)) )))

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const factor Float64)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const old_speed Float64)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const delta_speed Float64)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const fnt65 Float64)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const fnp1t65 Float64)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-sort tfloat64B 0)

(declare-fun user_eq2 (tfloat64B tfloat64B) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float64)

(declare-const dummy2 tfloat64B)

(declare-datatypes ()
((tfloat64B__ref (tfloat64B__refqtmk (tfloat64B__content tfloat64B)))))
(define-fun tfloat64B__ref_tfloat64B__content__projection ((a tfloat64B__ref)) tfloat64B 
  (tfloat64B__content a))

(declare-sort tframeB 0)

(declare-fun tframeBqtint (tframeB) Int)

;; tframeB'axiom
  (assert
  (forall ((i tframeB))
  (and (<= (- 32768) (tframeBqtint i)) (<= (tframeBqtint i) 32767))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 32768) x) (<= x 32767)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tframeB tframeB) Bool)

(declare-const dummy3 tframeB)

(declare-datatypes ()
((tframeB__ref (tframeB__refqtmk (tframeB__content tframeB)))))
(define-fun tframeB__ref_tframeB__content__projection ((a tframeB__ref)) tframeB 
  (tframeB__content a))

(declare-sort ratio_t 0)

(define-fun in_range3 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq4 (ratio_t ratio_t) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE5 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Float64)

(declare-const dummy4 ratio_t)

(declare-datatypes ()
((ratio_t__ref (ratio_t__refqtmk (ratio_t__content ratio_t)))))
(define-fun ratio_t__ref_ratio_t__content__projection ((a ratio_t__ref)) ratio_t 
  (ratio_t__content a))

(define-fun dynamic_invariant2 ((temp___expr_176 Float64)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))
                                     (in_range3 temp___expr_176)))

;; delta_speed__def_axiom
  (assert
  (= delta_speed (fp.mul RNE (fp.mul RNE factor (fp #b0 #b10000000000 #b1101101100000010000011000100100110111010010111100011)) (fp #b0 #b01111111001 #b0001000100010001000100010001000100010001000100010001))))

;; fnt65__def_axiom
  (assert
  (= fnt65 (fp.mul RNE (of_int RNE n) (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))

;; fnp1t65__def_axiom
  (assert
  (= fnp1t65 (fp.mul RNE (of_int RNE (+ n 1)) (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))

(declare-const new_speed Float64)

(declare-const average Float64)

(declare-const distance Float64)

;; Assume
  (assert (dynamic_invariant1 n true false true true))

;; Assume
  (assert (dynamic_invariant2 factor true false true true))

;; Assume
  (assert (dynamic_invariant old_speed true false true true))

;; Assume
  (assert (dynamic_invariant new_speed false false true true))

;; Assume
  (assert (dynamic_invariant average false false true true))

;; Assume
  (assert (dynamic_invariant distance true false true true))

;; H
  (assert (invariant____function_guard (invariant__ n old_speed) n
  old_speed))

;; Assume
  (assert (and (< n 25000) (= (invariant__ n old_speed) true)))

;; Assume
  (assert
  (= (fp.mul RNE (fp.mul RNE factor (fp #b0 #b10000000000 #b1101101100000010000011000100100110111010010111100011)) (fp #b0 #b01111111001 #b0001000100010001000100010001000100010001000100010001)) 
  delta_speed))

;; Assume
  (assert (dynamic_invariant delta_speed true false true true))

(define-fun o () Float64 (fp.add RNE old_speed delta_speed))

;; Ensures
  (assert (fp.isFinite64 o))

(declare-const new_speed1 Float64)

;; H
  (assert (= new_speed1 o))

;; Assert
  (assert
  (and
  (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) 
  delta_speed)
  (fp.leq delta_speed (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))))

;; H
  (assert (in_bounds__function_guard (in_bounds old_speed) old_speed))

;; Assert
  (assert (= (in_bounds old_speed) true))

;; H
  (assert (high_bound__function_guard (high_bound n) n))

;; H
  (assert (high_bound__function_guard (high_bound n) n))

;; H
  (assert (in_bounds__function_guard (in_bounds (high_bound n))
  (high_bound n)))

;; Assert
  (assert (= (in_bounds (high_bound n)) true))

;; H
  (assert (low_bound__function_guard (low_bound n) n))

;; H
  (assert (low_bound__function_guard (low_bound n) n))

;; H
  (assert (in_bounds__function_guard (in_bounds (low_bound n))
  (low_bound n)))

;; Assert
  (assert (= (in_bounds (low_bound n)) true))

;; Assert
  (assert
  (fp.leq new_speed1 (fp.add RNE old_speed (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))))

;; H
  (assert (high_bound__function_guard (high_bound n) n))

;; Assert
  (assert (fp.leq old_speed (high_bound n)))

;; H
  (assert (high_bound__function_guard (high_bound n) n))

;; Assert
  (assert
  (fp.leq (fp.add RNE old_speed (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) (fp.add RNE 
  (high_bound n) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))))

;; H
  (assert (high_bound__function_guard (high_bound n) n))

;; Assert
  (assert
  (fp.leq new_speed1 (fp.add RNE (high_bound n) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))))

;; Assume
  (assert
  (= (fp.mul RNE (of_int RNE n) (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)) 
  fnt65))

;; Assume
  (assert (dynamic_invariant fnt65 true false true true))

;; Assume
  (assert
  (= (fp.mul RNE (of_int RNE (+ n 1)) (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)) 
  fnp1t65))

;; Assume
  (assert (dynamic_invariant fnp1t65 true false true true))

;; Assert
  (assert (<= (+ (* n 65) 1) (* (+ n 1) 65)))

(define-fun o1 () Int (* (+ n 1) 65))

(assert
;; defqtvc
 ;; File "attempt_3.adb", line 29, characters 0-0
  (not (in_range2 o1)))
(check-sat)
