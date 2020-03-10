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

(declare-sort long_float 0)

(declare-fun user_eq (long_float long_float) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float64)

(declare-const dummy long_float)

(declare-datatypes ((long_float__ref 0))
(((long_float__refqtmk (long_float__content long_float)))))
(define-fun long_float__ref_long_float__content__projection ((a long_float__ref)) long_float 
  (long_float__content a))

(define-fun dynamic_invariant ((temp___expr_67 Float64)
  (temp___is_init_63 Bool) (temp___skip_constant_64 Bool)
  (temp___do_toplevel_65 Bool)
  (temp___do_typ_inv_66 Bool)) Bool (=>
                                    (or (= temp___is_init_63 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)) (fp #b0 #b11111111110 #b1111111111111111111111111111111111111111111111111111)))
                                    (fp.isFinite64 temp___expr_67)))

(declare-const ngrotations (_ BitVec 16))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const ngclicktime (_ BitVec 16))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const millisecs (_ BitVec 16))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-const attr__ATTRIBUTE_ADDRESS20 Int)

(declare-const attr__ATTRIBUTE_ADDRESS21 Int)

(declare-const attr__ATTRIBUTE_ADDRESS22 Int)

(declare-const attr__ATTRIBUTE_ADDRESS23 Int)

(declare-const attr__ATTRIBUTE_ADDRESS24 Int)

(declare-const attr__ATTRIBUTE_ADDRESS25 Int)

(declare-const attr__ATTRIBUTE_ADDRESS26 Int)

(declare-const attr__ATTRIBUTE_ADDRESS27 Int)

(declare-const attr__ATTRIBUTE_ADDRESS28 Int)

(declare-const attr__ATTRIBUTE_ADDRESS29 Int)

(declare-const attr__ATTRIBUTE_ADDRESS30 Int)

(declare-const attr__ATTRIBUTE_ADDRESS31 Int)

(declare-const attr__ATTRIBUTE_ADDRESS32 Int)

(declare-const attr__ATTRIBUTE_ADDRESS33 Int)

(declare-const attr__ATTRIBUTE_ADDRESS34 Int)

(declare-const attr__ATTRIBUTE_ADDRESS35 Int)

(declare-const attr__ATTRIBUTE_ADDRESS36 Int)

(declare-const attr__ATTRIBUTE_ADDRESS37 Int)

(declare-const attr__ATTRIBUTE_ADDRESS38 Int)

(declare-const attr__ATTRIBUTE_ADDRESS39 Int)

(declare-const attr__ATTRIBUTE_ADDRESS40 Int)

(declare-const attr__ATTRIBUTE_ADDRESS41 Int)

(declare-const attr__ATTRIBUTE_ADDRESS42 Int)

(declare-const attr__ATTRIBUTE_ADDRESS43 Int)

(declare-const attr__ATTRIBUTE_ADDRESS44 Int)

(declare-const attr__ATTRIBUTE_ADDRESS45 Int)

(declare-const attr__ATTRIBUTE_ADDRESS46 Int)

(declare-const attr__ATTRIBUTE_ADDRESS47 Int)

(declare-const attr__ATTRIBUTE_ADDRESS48 Int)

(declare-const attr__ATTRIBUTE_ADDRESS49 Int)

(declare-const attr__ATTRIBUTE_ADDRESS50 Int)

(declare-const attr__ATTRIBUTE_ADDRESS51 Int)

(declare-const attr__ATTRIBUTE_ADDRESS52 Int)

(declare-const attr__ATTRIBUTE_ADDRESS53 Int)

(declare-const attr__ATTRIBUTE_ADDRESS54 Int)

(declare-const validity_period Float64)

(declare-const attr__ATTRIBUTE_ADDRESS55 Int)

(declare-sort unsigned_16 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 16))

(declare-fun user_eq1 (unsigned_16 unsigned_16) Bool)

(declare-const dummy1 unsigned_16)

(declare-datatypes ((unsigned_16__ref 0))
(((unsigned_16__refqtmk (unsigned_16__content unsigned_16)))))
(define-fun unsigned_16__ref_unsigned_16__content__projection ((a unsigned_16__ref)) unsigned_16 
  (unsigned_16__content a))

(define-fun dynamic_invariant1 ((temp___expr_158 (_ BitVec 16))
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool) (temp___do_typ_inv_157 Bool)) Bool true)

(declare-sort tinteger_32B 0)

(declare-fun tinteger_32Bqtint (tinteger_32B) Int)

;; tinteger_32B'axiom
  (assert
  (forall ((i tinteger_32B))
  (and (<= (- 2147483648) (tinteger_32Bqtint i))
  (<= (tinteger_32Bqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tinteger_32B tinteger_32B) Bool)

(declare-const dummy2 tinteger_32B)

(declare-datatypes ((tinteger_32B__ref 0))
(((tinteger_32B__refqtmk (tinteger_32B__content tinteger_32B)))))
(define-fun tinteger_32B__ref_tinteger_32B__content__projection ((a tinteger_32B__ref)) tinteger_32B 
  (tinteger_32B__content a))

(declare-sort integer_32 0)

(declare-fun integer_32qtint (integer_32) Int)

;; integer_32'axiom
  (assert
  (forall ((i integer_32))
  (and (<= (- 2147483648) (integer_32qtint i))
  (<= (integer_32qtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (integer_32 integer_32) Bool)

(declare-const dummy3 integer_32)

(declare-datatypes ((integer_32__ref 0))
(((integer_32__refqtmk (integer_32__content integer_32)))))
(define-fun integer_32__ref_integer_32__content__2__projection ((a integer_32__ref)) integer_32 
  (integer_32__content a))

(define-fun dynamic_invariant2 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_165)))

;; validity_period__def_axiom
  (assert
  (= validity_period (fp #b0 #b10000001010 #b0111011100000000000000000000000000000000000000000000)))

(assert
;; defqtvc
 ;; File "nose_gear.ads", line 21, characters 0-0
  (not
  (forall ((estimatedgroundvelocity Float64)
  (old_ngclicktime_memory (_ BitVec 16))
  (old_ngrotations_memory (_ BitVec 16))
  (old_estimatedgroundvelocity_memory Float64)
  (old_ngclicktime_out1 (_ BitVec 16)) (old_ngrotations_out1 (_ BitVec 16))
  (old_estimatedgroundvelocity_out1 Float64) (max_uint16_out1 Int)
  (max_uint16_1_out1 Int) (max_uint16_2_out1 Int)
  (millisecs_out1 (_ BitVec 16)) (ngclicktime_out1 (_ BitVec 16))
  (ngrotations_out1 (_ BitVec 16)) (wheel_circunference_out1 Float64)
  (ms_in_hour_out1 Float64) (ms_in_our1_out1 Float64)
  (update_period_os_interrupt_out1 (_ BitVec 16))
  (validity_period_out1 (_ BitVec 16)) (to_int32_left_out1 Int)
  (to_int32_left_1_out1 Int) (to_int32_left_2_out1 Int)
  (to_int32_right_out1 Int) (to_int32_right_1_out1 Int)
  (to_int32_right_2_out1 Int) (data_type_conversion1_out1 Int)
  (data_type_conversion_out1 Int) (sum1_2_out1 (_ BitVec 16)) (sum1_out1 Int)
  (sum1_1_out1 Int) (sum2_out1 Int) (sum2_1_out1 Int) (sum1_1_1_out1 Int)
  (sum_out1 Int) (sum2_2_out1 Int) (sum_1_out1 Int) (sum_2_out1 Int)
  (sum_3_out1 Int) (left_out1 Int) (left_1_out1 Int) (left_2_out1 Int)
  (to_uint16_result_out1 (_ BitVec 16))
  (to_uint16_result_1_out1 (_ BitVec 16))
  (to_uint16_result_2_out1 (_ BitVec 16)) (distance_km_out1 Float64)
  (elapsed_time_h_out1 Float64) (avoid_div_by_zero_out1 Float64)
  (speed_out1 Float64) (old_output_if_new_invalid_out1 Float64)
  (old_ngclicktime_out11 (_ BitVec 16)) (old_ngrotations_out11 (_ BitVec 16))
  (max_uint16_out11 Int) (max_uint16_1_out11 Int) (max_uint16_2_out11 Int)
  (millisecs_out11 (_ BitVec 16)) (ngclicktime_out11 (_ BitVec 16))
  (ngrotations_out11 (_ BitVec 16)) (to_int32_left_out11 Int)
  (to_int32_left_1_out11 Int) (to_int32_left_2_out11 Int)
  (to_int32_right_out11 Int) (to_int32_right_1_out11 Int)
  (to_int32_right_2_out11 Int) (data_type_conversion1_out11 Int)
  (data_type_conversion_out11 Int))
  (=> (dynamic_invariant validity_period true false true true)
  (=>
  (= (fp #b0 #b10000001010 #b0111011100000000000000000000000000000000000000000000) 
  validity_period)
  (=> (dynamic_invariant1 old_ngclicktime_memory true false true true)
  (=> (= old_ngclicktime_out11 old_ngclicktime_memory)
  (=> (dynamic_invariant1 old_ngrotations_memory true false true true)
  (=> (= old_ngrotations_out11 old_ngrotations_memory)
  (=> (dynamic_invariant old_estimatedgroundvelocity_memory true false true
  true)
  (=> (dynamic_invariant1 ngrotations true false true true)
  (=> (dynamic_invariant1 ngclicktime true false true true)
  (=> (dynamic_invariant1 millisecs true false true true)
  (=> (dynamic_invariant estimatedgroundvelocity false false true true)
  (=> (dynamic_invariant1 old_ngclicktime_out1 false false true true)
  (=> (dynamic_invariant1 old_ngrotations_out1 false false true true)
  (=> (dynamic_invariant old_estimatedgroundvelocity_out1 false false true
  true)
  (=> (dynamic_invariant2 max_uint16_out1 false false true true)
  (=> (dynamic_invariant2 max_uint16_1_out1 false false true true)
  (=> (dynamic_invariant2 max_uint16_2_out1 false false true true)
  (=> (dynamic_invariant1 millisecs_out1 false false true true)
  (=> (dynamic_invariant1 ngclicktime_out1 false false true true)
  (=> (dynamic_invariant1 ngrotations_out1 false false true true)
  (=> (dynamic_invariant wheel_circunference_out1 false false true true)
  (=> (dynamic_invariant ms_in_hour_out1 false false true true)
  (=> (dynamic_invariant ms_in_our1_out1 false false true true)
  (=> (dynamic_invariant1 update_period_os_interrupt_out1 false false true
  true)
  (=> (dynamic_invariant1 validity_period_out1 false false true true)
  (=> (dynamic_invariant2 to_int32_left_out1 false false true true)
  (=> (dynamic_invariant2 to_int32_left_1_out1 false false true true)
  (=> (dynamic_invariant2 to_int32_left_2_out1 false false true true)
  (=> (dynamic_invariant2 to_int32_right_out1 false false true true)
  (=> (dynamic_invariant2 to_int32_right_1_out1 false false true true)
  (=> (dynamic_invariant2 to_int32_right_2_out1 false false true true)
  (=> (dynamic_invariant2 data_type_conversion1_out1 false false true true)
  (=> (dynamic_invariant2 data_type_conversion_out1 false false true true)
  (=> (dynamic_invariant1 sum1_2_out1 false false true true)
  (=> (dynamic_invariant2 sum1_out1 false false true true)
  (=> (dynamic_invariant2 sum1_1_out1 false false true true)
  (=> (dynamic_invariant2 sum2_out1 false false true true)
  (=> (dynamic_invariant2 sum2_1_out1 false false true true)
  (=> (dynamic_invariant2 sum1_1_1_out1 false false true true)
  (=> (dynamic_invariant2 sum_out1 false false true true)
  (=> (dynamic_invariant2 sum2_2_out1 false false true true)
  (=> (dynamic_invariant2 sum_1_out1 false false true true)
  (=> (dynamic_invariant2 sum_2_out1 false false true true)
  (=> (dynamic_invariant2 sum_3_out1 false false true true)
  (=> (dynamic_invariant2 left_out1 false false true true)
  (=> (dynamic_invariant2 left_1_out1 false false true true)
  (=> (dynamic_invariant2 left_2_out1 false false true true)
  (=> (dynamic_invariant1 to_uint16_result_out1 false false true true)
  (=> (dynamic_invariant1 to_uint16_result_1_out1 false false true true)
  (=> (dynamic_invariant1 to_uint16_result_2_out1 false false true true)
  (=> (dynamic_invariant distance_km_out1 false false true true)
  (=> (dynamic_invariant elapsed_time_h_out1 false false true true)
  (=> (dynamic_invariant avoid_div_by_zero_out1 false false true true)
  (=> (dynamic_invariant speed_out1 false false true true)
  (=> (dynamic_invariant old_output_if_new_invalid_out1 false false true
  true)
  (=> (= max_uint16_out11 65535)
  (=> (= max_uint16_1_out11 65535)
  (=> (= max_uint16_2_out11 65535)
  (=> (= millisecs_out11 millisecs)
  (=> (= ngclicktime_out11 ngclicktime)
  (=> (= ngrotations_out11 ngrotations)
  (=> (= to_int32_left_out11 (bv2nat ngrotations_out11))
  (=> (= to_int32_left_1_out11 (bv2nat ngclicktime_out11))
  (=> (= to_int32_left_2_out11 (bv2nat millisecs_out11))
  (=> (= to_int32_right_out11 (bv2nat old_ngrotations_out11))
  (=> (= to_int32_right_1_out11 (bv2nat old_ngclicktime_out11))
  (=> (= to_int32_right_2_out11 (bv2nat old_ngclicktime_out11))
  (=> (= data_type_conversion1_out11 (bv2nat millisecs_out11))
  (=> (= data_type_conversion_out11 (bv2nat old_ngclicktime_out11))
  (let ((o (- to_int32_right_out11 to_int32_left_out11)))
  (=> (in_range1 o)
  (forall ((sum1_out11 Int))
  (=> (= sum1_out11 o)
  (let ((o1 (- to_int32_right_1_out11 to_int32_left_1_out11)))
  (=> (in_range1 o1)
  (forall ((sum1_1_out11 Int))
  (=> (= sum1_1_out11 o1)
  (let ((o2 (- to_int32_left_out11 to_int32_right_out11)))
  (=> (in_range1 o2)
  (forall ((sum2_out11 Int))
  (=> (= sum2_out11 o2)
  (let ((o3 (- to_int32_left_1_out11 to_int32_right_1_out11)))
  (=> (in_range1 o3)
  (forall ((sum2_1_out11 Int))
  (=> (= sum2_1_out11 o3)
  (let ((o4 (- to_int32_right_2_out11 to_int32_left_2_out11)))
  (=> (in_range1 o4)
  (forall ((sum1_1_1_out11 Int))
  (=> (= sum1_1_1_out11 o4)
  (let ((o5 (- data_type_conversion1_out11 data_type_conversion_out11)))
  (=> (in_range1 o5)
  (forall ((sum_out11 Int))
  (=> (= sum_out11 o5)
  (let ((o6 (- to_int32_left_2_out11 to_int32_right_2_out11)))
  (=> (in_range1 o6)
  (forall ((sum2_2_out11 Int))
  (=> (= sum2_2_out11 o6)
  (forall ((compare_to_constant_out1 Bool))
  (=>
  (= compare_to_constant_out1 (ite (fp.leq ((_ to_fp 11 53) RNE (to_real sum_out11)) 
                              validity_period) true false))
  (let ((o7 (- max_uint16_out11 sum1_out11)))
  (=> (in_range1 o7)
  (forall ((sum_1_out11 Int))
  (=> (= sum_1_out11 o7)
  (let ((o8 (- max_uint16_1_out11 sum1_1_out11)))
  (=> (in_range1 o8)
  (forall ((sum_2_out11 Int))
  (=> (= sum_2_out11 o8)
  (let ((o9 (- max_uint16_2_out11 sum1_1_1_out11)))
  (=> (in_range1 o9)
  (forall ((sum_3_out11 Int))
  (=> (= sum_3_out11 o9)
  (forall ((spark__branch Bool) (left_out11 Int))
  (=>
  (and (= spark__branch (ite (<= 0 sum2_out11) true false))
  (ite (= spark__branch true) (= left_out11 sum2_out11)
  (= left_out11 sum_1_out11)))
  (forall ((spark__branch1 Bool) (left_1_out11 Int))
  (=>
  (and (= spark__branch1 (ite (<= 0 sum2_1_out11) true false))
  (ite (= spark__branch1 true) (= left_1_out11 sum2_1_out11)
  (= left_1_out11 sum_2_out11)))
  (forall ((spark__branch2 Bool) (left_2_out11 Int))
  (=>
  (and (= spark__branch2 (ite (<= 0 sum2_2_out11) true false))
  (ite (= spark__branch2 true) (= left_2_out11 sum2_2_out11)
  (= left_2_out11 sum_3_out11)))
  (=> (uint_in_range left_out11)
  (forall ((to_uint16_result_out11 (_ BitVec 16)))
  (=> (= to_uint16_result_out11 ((_ int2bv 16) left_out11))
  (=> (<= left_1_out11 65535)
  (=> (uint_in_range left_1_out11)
  (forall ((to_uint16_result_1_out11 (_ BitVec 16)))
  (=> (= to_uint16_result_1_out11 ((_ int2bv 16) left_1_out11))
  (uint_in_range left_2_out11))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
