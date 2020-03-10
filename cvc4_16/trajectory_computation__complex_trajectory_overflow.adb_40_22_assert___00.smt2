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

(declare-fun nth ((_ BitVec 16) Int) Bool)

(declare-fun lsr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(declare-fun rotate_right1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 16))) Int (ite (bvsge x (_ bv0 16))
                                            (bv2nat x)
                                            (- (- 65536 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvshl v (bvurem n (_ bv16 16))) (bvlshr v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvlshr v (bvurem n (_ bv16 16))) (bvshl v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 16) (_ BitVec 16)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x0001) #x0000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 16)) (i Int))
  (=> (and (<= 0 i) (< i 65536)) (= (nth_bv x ((_ int2bv 16) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 16) (_ BitVec 16) (_ BitVec 16)
  (_ BitVec 16)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (let ((mask (bvshl (bvsub (bvshl #x0001 n) #x0001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 16)) (b (_ BitVec 16)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 16))))))
(declare-fun power ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun bv_min ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

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

(declare-fun nth1 ((_ BitVec 8) Int) Bool)

(declare-fun lsr1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_right2 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left2 ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun to_int2 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr1 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr1 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl1 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left2 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right2 v (bv2nat n)))))

(declare-fun nth_bv1 ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv1 x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth1 x (bv2nat i)) (nth_bv1 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv1 x ((_ int2bv 8) i)) (nth1 x i)))))

(declare-fun eq_sub_bv1 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv1 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub1 ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub1 a b (bv2nat i) (bv2nat n)) (eq_sub_bv1 a b i n))))

(declare-fun nth2 ((_ BitVec 32) Int) Bool)

(declare-fun lsr2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl2 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_right3 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left3 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun to_int3 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2nat x)
                                            (- (- 4294967296 (bv2nat x)))))

(define-fun uint_in_range2 ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvlshr x n) (lsr2 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvashr x n) (asr2 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvshl x n) (lsl2 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_left3 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_right3 v (bv2nat n)))))

(declare-fun nth_bv2 ((_ BitVec 32) (_ BitVec 32)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (= (nth_bv2 x i) true)
  (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (nth2 x (bv2nat i)) (nth_bv2 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 32)) (i Int))
  (=> (and (<= 0 i) (< i 4294967296))
  (= (nth_bv2 x ((_ int2bv 32) i)) (nth2 x i)))))

(declare-fun eq_sub_bv2 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
  (= (eq_sub_bv2 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub2 ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth2 a j) (nth2 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (= (eq_sub2 a b (bv2nat i) (bv2nat n)) (eq_sub_bv2 a b i n))))

(declare-fun nth3 ((_ BitVec 64) Int) Bool)

(declare-fun lsr3 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr3 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl3 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_right4 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left4 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun to_int4 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2nat x)
                                            (- (- 18446744073709551616 (bv2nat x)))))

(define-fun uint_in_range3 ((i Int)) Bool (and (<= 0 i)
                                          (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvlshr x n) (lsr3 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvashr x n) (asr3 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvshl x n) (lsl3 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_left4 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_right4 v (bv2nat n)))))

(declare-fun nth_bv3 ((_ BitVec 64) (_ BitVec 64)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (= (nth_bv3 x i) true)
  (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (nth3 x (bv2nat i)) (nth_bv3 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 64)) (i Int))
  (=> (and (<= 0 i) (< i 18446744073709551616))
  (= (nth_bv3 x ((_ int2bv 64) i)) (nth3 x i)))))

(declare-fun eq_sub_bv3 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
  (= (eq_sub_bv3 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub3 ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth3 a j) (nth3 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (= (eq_sub3 a b (bv2nat i) (bv2nat n)) (eq_sub_bv3 a b i n))))

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 Float64)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const bound Float64)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun low_bound (Int) Float64)

(declare-fun low_bound__function_guard (Float64 Int) Bool)

(declare-sort float64 0)

(declare-fun user_eq (float64 float64) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float64)

(declare-const dummy float64)

(declare-datatypes ((float64__ref 0))
(((float64__refqtmk (float64__content float64)))))
(define-fun float64__ref_float64__content__projection ((a float64__ref)) float64 
  (float64__content a))

(define-fun dynamic_invariant ((temp___expr_163 Float64)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                     (fp.isFinite64 temp___expr_163)))

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

(declare-datatypes ((frame__ref 0))
(((frame__refqtmk (frame__content frame)))))
(define-fun frame__ref_frame__content__projection ((a frame__ref)) frame 
  (frame__content a))

(define-fun dynamic_invariant1 ((temp___expr_170 Int)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=>
                                     (or (= temp___is_init_166 true)
                                     (<= 0 25000)) (in_range1
                                     temp___expr_170)))

;; low_bound__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true) (dynamic_invariant
     (low_bound n) true false true true)) :pattern ((low_bound n)) )))

;; low_bound__def_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true)
     (= (low_bound n) (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))) :pattern (
  (low_bound n)) )))

(declare-fun high_bound (Int) Float64)

(declare-fun high_bound__function_guard (Float64 Int) Bool)

;; high_bound__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true) (dynamic_invariant
     (high_bound n) true false true true)) :pattern ((high_bound n)) )))

;; high_bound__def_axiom
  (assert
  (forall ((n Int))
  (! (=> (dynamic_invariant1 n true true true true)
     (= (high_bound n) (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) 
     bound))) :pattern ((high_bound n)) )))

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

(declare-fun invariant__ (Int Float64) Bool)

(declare-fun invariant____function_guard (Bool Int Float64) Bool)

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((n Int))
  (forall ((speed Float64))
  (! (= (= (invariant__ n speed) true)
     (and (fp.leq (low_bound n) speed) (fp.leq speed (high_bound n)))) :pattern (
  (invariant__ n speed)) ))))

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const factor Float64)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const drag Float64)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const old_speed Float64)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const delta_speed Float64)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-fun t (Int) Float64)

(declare-fun t__function_guard (Float64 Int) Bool)

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

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

;; t__post_axiom
  (assert
  (forall ((n1 Int))
  (! (=> (dynamic_invariant2 n1 true true true true) (dynamic_invariant
     (t n1) true false true true)) :pattern ((t n1)) )))

;; t__def_axiom
  (assert
  (forall ((n1 Int))
  (! (=> (dynamic_invariant2 n1 true true true true)
     (= (t n1) ((_ to_fp 11 53) RNE (to_real n1)))) :pattern ((t n1)) )))

(declare-const n_bv (_ BitVec 16))

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-sort tfloat64B 0)

(declare-fun user_eq3 (tfloat64B tfloat64B) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float64)

(declare-const dummy3 tfloat64B)

(declare-datatypes ((tfloat64B__ref 0))
(((tfloat64B__refqtmk (tfloat64B__content tfloat64B)))))
(define-fun tfloat64B__ref_tfloat64B__content__projection ((a tfloat64B__ref)) tfloat64B 
  (tfloat64B__content a))

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

(declare-datatypes ((ratio_t__ref 0))
(((ratio_t__refqtmk (ratio_t__content ratio_t)))))
(define-fun ratio_t__ref_ratio_t__content__projection ((a ratio_t__ref)) ratio_t 
  (ratio_t__content a))

(define-fun dynamic_invariant3 ((temp___expr_177 Float64)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (fp.leq (fp.neg (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)))
                                     (in_range3 temp___expr_177)))

(declare-sort drag_t 0)

(define-fun in_range4 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq5 (drag_t drag_t) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE6 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Float64)

(declare-const dummy5 drag_t)

(declare-datatypes ((drag_t__ref 0))
(((drag_t__refqtmk (drag_t__content drag_t)))))
(define-fun drag_t__ref_drag_t__content__projection ((a drag_t__ref)) drag_t 
  (drag_t__content a))

(define-fun dynamic_invariant4 ((temp___expr_184 Float64)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (=>
                                     (or (= temp___is_init_180 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)) (fp #b0 #b10000000101 #b0000000000000000000000000000000000000000000000000000)))
                                     (in_range4 temp___expr_184)))

(declare-sort unsigned_16 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE7 ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) (_ BitVec 16))

(declare-fun user_eq6 (unsigned_16 unsigned_16) Bool)

(declare-const dummy6 unsigned_16)

(declare-datatypes ((unsigned_16__ref 0))
(((unsigned_16__refqtmk (unsigned_16__content unsigned_16)))))
(define-fun unsigned_16__ref_unsigned_16__content__projection ((a unsigned_16__ref)) unsigned_16 
  (unsigned_16__content a))

(define-fun dynamic_invariant5 ((temp___expr_191 (_ BitVec 16))
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool) (temp___do_typ_inv_190 Bool)) Bool true)

;; delta_speed__def_axiom
  (assert
  (= delta_speed (fp.add RNE drag (fp.mul RNE (fp.mul RNE factor (fp #b0 #b10000000010 #b0011100111010010111100011010100111111011111001110111)) (fp #b0 #b01111111001 #b0001000100010001000100010001000100010001000100010001)))))

;; n_bv__def_axiom
  (assert (= n_bv ((_ int2bv 16) n)))

;; bound__def_axiom
  (assert
  (= bound (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)))

(assert
;; defqtvc
 ;; File "complex_trajectory_overflow.ads", line 33, characters 0-0
  (not
  (forall ((speed Float64) (distance Float64) (average Float64))
  (=> (dynamic_invariant bound true false true true)
  (=>
  (= (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000) 
  bound)
  (=> (dynamic_invariant1 n true false true true)
  (=> (dynamic_invariant3 factor true false true true)
  (=> (dynamic_invariant4 drag true false true true)
  (=> (dynamic_invariant speed true false true true)
  (=> (dynamic_invariant distance true false true true)
  (=> (dynamic_invariant average false false true true)
  (=> (< n 25000)
  (=> (= (invariant__ n speed) true)
  (=> (= speed old_speed)
  (=> (dynamic_invariant old_speed true false true true)
  (=>
  (= (fp.add RNE drag (fp.mul RNE (fp.mul RNE factor (fp #b0 #b10000000010 #b0011100111010010111100011010100111111011111001110111)) (fp #b0 #b01111111001 #b0001000100010001000100010001000100010001000100010001))) 
  delta_speed)
  (=> (dynamic_invariant delta_speed true false true true)
  (=> (= ((_ int2bv 16) n) n_bv)
  (=> (dynamic_invariant5 n_bv true false true true)
  (let ((o (fp.add RNE speed delta_speed)))
  (=> (fp.isFinite64 o)
  (forall ((speed1 Float64))
  (=> (= speed1 o)
  (=>
  (and
  (fp.leq (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000)) 
  delta_speed) (fp.leq delta_speed bound))
  (=> (= (in_bounds (high_bound n)) true)
  (=> (= (in_bounds (low_bound n)) true)
  (=>
  (fp.eq (fp.add RNE (fp.mul RNE ((_ to_fp_unsigned 11 53) RNE n_bv) 
  bound) bound) (fp.mul RNE (fp.add RNE ((_ to_fp_unsigned 11 53) RNE 
  n_bv) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) 
  bound))
  (=>
  (fp.eq (fp.add RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) bound) 
  bound) (fp.mul RNE (fp.add RNE ((_ to_fp 11 53) RNE (to_real n)) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) 
  bound))
  (=>
  (fp.eq (fp.sub RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) 
  bound) (fp.mul RNE (fp.add RNE ((_ to_fp 11 53) RNE (to_real n)) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))))
  (=>
  (fp.eq (t 1) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))
  (=>
  (fp.eq (fp.add RNE ((_ to_fp 11 53) RNE (to_real n)) (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000)) ((_ to_fp 11 53) RNE (to_real (+ 
  n 1))))
  (=>
  (fp.leq (fp.sub RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real n)) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) 
  bound) speed1)
  (=>
  (fp.leq (fp.mul RNE ((_ to_fp 11 53) RNE (to_real (+ n 1))) (fp.neg (fp #b0 #b10000000101 #b0000010000000000000000000000000000000000000000000000))) speed1)
  (=>
  (fp.leq speed1 (fp.add RNE (fp.mul RNE ((_ to_fp 11 53) RNE (to_real 
  n)) bound) bound))
  (fp.leq speed1 (fp.mul RNE ((_ to_fp 11 53) RNE (to_real (+ n 1))) 
  bound))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
