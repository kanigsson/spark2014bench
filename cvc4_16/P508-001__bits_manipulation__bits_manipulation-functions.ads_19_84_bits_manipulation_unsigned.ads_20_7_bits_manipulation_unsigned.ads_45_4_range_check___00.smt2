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

(declare-fun nth ((_ BitVec 64) Int) Bool)

(declare-fun lsr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl ((_ BitVec 64) Int) (_ BitVec 64))

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

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2nat x)
                                            (- (- 18446744073709551616 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (= (nth_bv x i) true)
  (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 64)) (i Int))
  (=> (and (<= 0 i) (< i 18446744073709551616))
  (= (nth_bv x ((_ int2bv 64) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 64))))))
(declare-fun power ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

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

(declare-fun shift_right ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun shift_right__function_guard ((_ BitVec 64) (_ BitVec 64)
  Int) Bool)

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

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 (_ BitVec 8))))))
(declare-fun power1 ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min1 ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(declare-fun nth2 ((_ BitVec 16) Int) Bool)

(declare-fun lsr2 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr2 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl2 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_right3 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left3 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun to_int3 ((x (_ BitVec 16))) Int (ite (bvsge x (_ bv0 16))
                                            (bv2nat x)
                                            (- (- 65536 (bv2nat x)))))

(define-fun uint_in_range2 ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvlshr x n) (lsr2 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvashr x n) (asr2 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvshl x n) (lsl2 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvshl v (bvurem n (_ bv16 16))) (bvlshr v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_left3 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvlshr v (bvurem n (_ bv16 16))) (bvshl v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_right3 v (bv2nat n)))))

(declare-fun nth_bv2 ((_ BitVec 16) (_ BitVec 16)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (= (nth_bv2 x i) true) (not (= (bvand (bvlshr x i) #x0001) #x0000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (nth2 x (bv2nat i)) (nth_bv2 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 16)) (i Int))
  (=> (and (<= 0 i) (< i 65536))
  (= (nth_bv2 x ((_ int2bv 16) i)) (nth2 x i)))))

(declare-fun eq_sub_bv2 ((_ BitVec 16) (_ BitVec 16) (_ BitVec 16)
  (_ BitVec 16)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (let ((mask (bvshl (bvsub (bvshl #x0001 n) #x0001) i)))
  (= (eq_sub_bv2 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub2 ((a (_ BitVec 16)) (b (_ BitVec 16)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth2 a j) (nth2 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (= (eq_sub2 a b (bv2nat i) (bv2nat n)) (eq_sub_bv2 a b i n))))

(declare-datatypes ((t__ref2 0))
(((t__refqtmk2 (t__content2 (_ BitVec 16))))))
(declare-fun power2 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun bv_min2 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) x y))

(define-fun bv_max2 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) y x))

(declare-fun nth3 ((_ BitVec 32) Int) Bool)

(declare-fun lsr3 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr3 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl3 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_right4 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left4 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun to_int4 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2nat x)
                                            (- (- 4294967296 (bv2nat x)))))

(define-fun uint_in_range3 ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvlshr x n) (lsr3 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvashr x n) (asr3 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvshl x n) (lsl3 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_left4 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_right4 v (bv2nat n)))))

(declare-fun nth_bv3 ((_ BitVec 32) (_ BitVec 32)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (= (nth_bv3 x i) true)
  (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (nth3 x (bv2nat i)) (nth_bv3 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 32)) (i Int))
  (=> (and (<= 0 i) (< i 4294967296))
  (= (nth_bv3 x ((_ int2bv 32) i)) (nth3 x i)))))

(declare-fun eq_sub_bv3 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
  (= (eq_sub_bv3 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub3 ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth3 a j) (nth3 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (= (eq_sub3 a b (bv2nat i) (bv2nat n)) (eq_sub_bv3 a b i n))))

(declare-datatypes ((t__ref3 0))
(((t__refqtmk3 (t__content3 (_ BitVec 32))))))
(declare-fun power3 ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min3 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max3 ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-sort modular 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 64))

(declare-fun user_eq1 (modular modular) Bool)

(declare-const dummy1 modular)

(declare-datatypes ((modular__ref 0))
(((modular__refqtmk (modular__content modular)))))
(define-fun modular__ref_modular__content__4__projection ((a modular__ref)) modular 
  (modular__content a))

(define-fun dynamic_invariant1 ((temp___expr_492 (_ BitVec 64))
  (temp___is_init_488 Bool) (temp___skip_constant_489 Bool)
  (temp___do_toplevel_490 Bool) (temp___do_typ_inv_491 Bool)) Bool true)

;; shift_right__post_axiom
  (assert
  (forall ((v (_ BitVec 64)))
  (forall ((amount Int))
  (! (=>
     (and (dynamic_invariant1 v true true true true) (dynamic_invariant
     amount true true true true)) (dynamic_invariant1 (shift_right v amount)
     true false true true)) :pattern ((shift_right v amount)) ))))

;; shift_right__def_axiom
  (assert
  (forall ((v (_ BitVec 64)))
  (forall ((amount Int))
  (! (=>
     (and (dynamic_invariant1 v true true true true) (dynamic_invariant
     amount true true true true))
     (= (shift_right v amount) (ite (and (<= 1 64) (<= 64 8))
                               ((_ zero_extend 56) (ite (< amount 8)
                                                   (bvlshr ((_ extract 7 0) v) ((_ int2bv 8) amount))
                                                   #x00))
                               (ite (and (<= 9 64) (<= 64 16))
                               ((_ zero_extend 48) (ite (< amount 16)
                                                   (bvlshr ((_ extract 15 0) v) ((_ int2bv 16) amount))
                                                   #x0000))
                               (ite (and (<= 17 64) (<= 64 32))
                               ((_ zero_extend 32) (bvlshr ((_ extract 31 0) v) ((_ int2bv 32) amount)))
                               (bvlshr v ((_ int2bv 64) amount))))))) :pattern (
  (shift_right v amount)) ))))

(declare-fun shift_left ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun shift_left__function_guard ((_ BitVec 64) (_ BitVec 64)
  Int) Bool)

;; shift_left__post_axiom
  (assert
  (forall ((v (_ BitVec 64)))
  (forall ((amount Int))
  (! (=>
     (and (dynamic_invariant1 v true true true true) (dynamic_invariant
     amount true true true true)) (dynamic_invariant1 (shift_left v amount)
     true false true true)) :pattern ((shift_left v amount)) ))))

;; shift_left__def_axiom
  (assert
  (forall ((v (_ BitVec 64)))
  (forall ((amount Int))
  (! (=>
     (and (dynamic_invariant1 v true true true true) (dynamic_invariant
     amount true true true true))
     (= (shift_left v amount) (ite (and (<= 1 64) (<= 64 8))
                              ((_ zero_extend 56) (ite (< amount 8)
                                                  (bvshl ((_ extract 7 0) v) ((_ int2bv 8) amount))
                                                  #x00))
                              (ite (and (<= 9 64) (<= 64 16))
                              ((_ zero_extend 48) (ite (< amount 16)
                                                  (bvshl ((_ extract 15 0) v) ((_ int2bv 16) amount))
                                                  #x0000))
                              (ite (and (<= 17 64) (<= 64 32))
                              ((_ zero_extend 32) (bvshl ((_ extract 31 0) v) ((_ int2bv 32) amount)))
                              (bvshl v ((_ int2bv 64) amount))))))) :pattern (
  (shift_left v amount)) ))))

(declare-fun make_mask (Int) (_ BitVec 64))

(declare-fun make_mask__function_guard ((_ BitVec 64) Int) Bool)

(declare-sort mask_size 0)

(declare-fun mask_sizeqtint (mask_size) Int)

;; mask_size'axiom
  (assert
  (forall ((i mask_size))
  (and (<= 1 (mask_sizeqtint i)) (<= (mask_sizeqtint i) 64))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 64)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (mask_size mask_size) Bool)

(declare-const dummy2 mask_size)

(declare-datatypes ((mask_size__ref 0))
(((mask_size__refqtmk (mask_size__content mask_size)))))
(define-fun mask_size__ref_mask_size__content__7__projection ((a mask_size__ref)) mask_size 
  (mask_size__content a))

(define-fun dynamic_invariant2 ((temp___expr_506 Int)
  (temp___is_init_502 Bool) (temp___skip_constant_503 Bool)
  (temp___do_toplevel_504 Bool)
  (temp___do_typ_inv_505 Bool)) Bool (=>
                                     (or (= temp___is_init_502 true)
                                     (<= 1 64)) (in_range1 temp___expr_506)))

;; make_mask__post_axiom
  (assert
  (forall ((num_bits Int))
  (! (=> (dynamic_invariant2 num_bits true true true true)
     (dynamic_invariant1 (make_mask num_bits) true false true true)) :pattern (
  (make_mask num_bits)) )))

;; make_mask__def_axiom
  (assert
  (forall ((num_bits Int))
  (! (=> (dynamic_invariant2 num_bits true true true true)
     (= (make_mask num_bits) (shift_right #xFFFFFFFFFFFFFFFF (- 64 num_bits)))) :pattern (
  (make_mask num_bits)) )))

(declare-const value (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const from Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const to__ Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun extract_bits_inline_always ((_ BitVec 64) Int
  Int) (_ BitVec 64))

(declare-fun extract_bits_inline_always__function_guard ((_ BitVec 64)
  (_ BitVec 64) Int Int) Bool)

(declare-sort bit_position 0)

(declare-fun bit_positionqtint (bit_position) Int)

;; bit_position'axiom
  (assert
  (forall ((i bit_position))
  (and (<= 0 (bit_positionqtint i)) (<= (bit_positionqtint i) 63))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 63)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (bit_position bit_position) Bool)

(declare-const dummy3 bit_position)

(declare-datatypes ((bit_position__ref 0))
(((bit_position__refqtmk (bit_position__content bit_position)))))
(define-fun bit_position__ref_bit_position__content__7__projection ((a bit_position__ref)) bit_position 
  (bit_position__content a))

(define-fun dynamic_invariant3 ((temp___expr_499 Int)
  (temp___is_init_495 Bool) (temp___skip_constant_496 Bool)
  (temp___do_toplevel_497 Bool)
  (temp___do_typ_inv_498 Bool)) Bool (=>
                                     (or (= temp___is_init_495 true)
                                     (<= 0 63)) (in_range2 temp___expr_499)))

;; extract_bits_inline_always__post_axiom
  (assert
  (forall ((value1 (_ BitVec 64)))
  (forall ((from1 Int) (to__1 Int))
  (! (=>
     (and
     (and
     (and (dynamic_invariant1 value1 true true true true) (dynamic_invariant3
     from1 true true true true)) (dynamic_invariant3 to__1 true true true
     true)) (<= from1 to__1))
     (let ((result (extract_bits_inline_always value1 from1 to__1)))
     (and
     (and
     (and
     (= result (bvand (shift_right value1 from1) (make_mask
                                                 (+ (- to__1 from1) 1))))
     (bvule result (make_mask (+ (- to__1 from1) 1))))
     (= (shift_left result from1) (bvand value1 (shift_left
                                                (make_mask
                                                (+ (- to__1 from1) 1)) from1))))
     (dynamic_invariant1 result true false true true)))) :pattern ((extract_bits_inline_always
                                                                   value1
                                                                   from1
                                                                   to__1)) ))))

(declare-fun extract_bits_inline ((_ BitVec 64) Int Int) (_ BitVec 64))

(declare-fun extract_bits_inline__function_guard ((_ BitVec 64) (_ BitVec 64)
  Int Int) Bool)

;; extract_bits_inline__post_axiom
  (assert
  (forall ((value1 (_ BitVec 64)))
  (forall ((from1 Int) (to__1 Int))
  (! (=>
     (and
     (and
     (and (dynamic_invariant1 value1 true true true true) (dynamic_invariant3
     from1 true true true true)) (dynamic_invariant3 to__1 true true true
     true)) (<= from1 to__1))
     (let ((result (extract_bits_inline value1 from1 to__1)))
     (and
     (and
     (and
     (= result (bvand (shift_right value1 from1) (make_mask
                                                 (+ (- to__1 from1) 1))))
     (bvule result (make_mask (+ (- to__1 from1) 1))))
     (= (shift_left result from1) (bvand value1 (shift_left
                                                (make_mask
                                                (+ (- to__1 from1) 1)) from1))))
     (dynamic_invariant1 result true false true true)))) :pattern ((extract_bits_inline
                                                                   value1
                                                                   from1
                                                                   to__1)) ))))

;; extract_bits_inline__def_axiom
  (assert
  (forall ((value1 (_ BitVec 64)))
  (forall ((from1 Int) (to__1 Int))
  (! (=>
     (and
     (and (dynamic_invariant1 value1 true true true true) (dynamic_invariant3
     from1 true true true true)) (dynamic_invariant3 to__1 true true true
     true))
     (= (extract_bits_inline value1 from1 to__1) (extract_bits_inline_always
                                                 value1 from1 to__1))) :pattern (
  (extract_bits_inline value1 from1 to__1)) ))))

(declare-fun extract_bits_not_inline ((_ BitVec 64) Int Int) (_ BitVec 64))

(declare-fun extract_bits_not_inline__function_guard ((_ BitVec 64)
  (_ BitVec 64) Int Int) Bool)

;; extract_bits_not_inline__post_axiom
  (assert
  (forall ((value1 (_ BitVec 64)))
  (forall ((from1 Int) (to__1 Int))
  (! (=>
     (and
     (and
     (and (dynamic_invariant1 value1 true true true true) (dynamic_invariant3
     from1 true true true true)) (dynamic_invariant3 to__1 true true true
     true)) (<= from1 to__1))
     (let ((result (extract_bits_not_inline value1 from1 to__1)))
     (and
     (and
     (and
     (= result (bvand (shift_right value1 from1) (make_mask
                                                 (+ (- to__1 from1) 1))))
     (bvule result (make_mask (+ (- to__1 from1) 1))))
     (= (shift_left result from1) (bvand value1 (shift_left
                                                (make_mask
                                                (+ (- to__1 from1) 1)) from1))))
     (dynamic_invariant1 result true false true true)))) :pattern ((extract_bits_not_inline
                                                                   value1
                                                                   from1
                                                                   to__1)) ))))

;; extract_bits_not_inline__def_axiom
  (assert
  (forall ((value1 (_ BitVec 64)))
  (forall ((from1 Int) (to__1 Int))
  (! (=>
     (and
     (and (dynamic_invariant1 value1 true true true true) (dynamic_invariant3
     from1 true true true true)) (dynamic_invariant3 to__1 true true true
     true))
     (= (extract_bits_not_inline value1 from1 to__1) (extract_bits_inline_always
                                                     value1 from1 to__1))) :pattern (
  (extract_bits_not_inline value1 from1 to__1)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(assert
;; defqtvc
 ;; File "bits_manipulation-functions.ads", line 13, characters 0-0
  (not
  (forall ((result__ (_ BitVec 64)) (result__1 (_ BitVec 64))
  (bits_manipulation_unsigned__unsigned_64__functions__extract_bits__result (_ BitVec 64)))
  (=> (dynamic_invariant1 value true false true true)
  (=> (dynamic_invariant3 from true false true true)
  (=> (dynamic_invariant3 to__ true false true true)
  (=> (<= from to__)
  (=> (dynamic_invariant1 result__ false false true true)
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= 2 0) true false))
  (ite (= spark__branch true)
  (let ((o to__))
  (let ((o1 from))
  (let ((o2 value))
  (let ((o3 (extract_bits_not_inline o2 o1 o)))
  (and
  (and (dynamic_invariant1 o3 true false true true)
  (and (= o3 (extract_bits_inline_always o2 o1 o))
  (and
  (and (= o3 (bvand (shift_right o2 o1) (make_mask (+ (- o o1) 1))))
  (bvule o3 (make_mask (+ (- o o1) 1))))
  (= (shift_left o3 o1) (bvand o2 (shift_left (make_mask (+ (- o o1) 1)) o1))))))
  (= result__1 o3))))))
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= 2 1) true false))
  (ite (= spark__branch1 true)
  (let ((o to__))
  (let ((o1 from))
  (let ((o2 value))
  (let ((o3 (extract_bits_inline o2 o1 o)))
  (and
  (and (dynamic_invariant1 o3 true false true true)
  (and (= o3 (extract_bits_inline_always o2 o1 o))
  (and
  (and (= o3 (bvand (shift_right o2 o1) (make_mask (+ (- o o1) 1))))
  (bvule o3 (make_mask (+ (- o o1) 1))))
  (= (shift_left o3 o1) (bvand o2 (shift_left (make_mask (+ (- o o1) 1)) o1))))))
  (= result__1 o3))))))
  (let ((o to__))
  (let ((o1 from))
  (let ((o2 value))
  (let ((o3 (extract_bits_inline_always o2 o1 o)))
  (and
  (and (dynamic_invariant1 o3 true false true true)
  (and
  (and (= o3 (bvand (shift_right o2 o1) (make_mask (+ (- o o1) 1))))
  (bvule o3 (make_mask (+ (- o o1) 1))))
  (= (shift_left o3 o1) (bvand o2 (shift_left (make_mask (+ (- o o1) 1)) o1)))))
  (= result__1 o3))))))))))))
  (=>
  (= bits_manipulation_unsigned__unsigned_64__functions__extract_bits__result result__1)
  (let ((o (+ (- to__ from) 1)))
  (=> (in_range1 o)
  (let ((o1 (make_mask o)))
  (=>
  (and (dynamic_invariant1 o1 true false true true)
  (= o1 (shift_right #xFFFFFFFFFFFFFFFF (- 64 o))))
  (let ((o2 from))
  (let ((o3 value))
  (let ((o4 (shift_right o3 o2)))
  (=>
  (and (dynamic_invariant1 o4 true false true true)
  (= o4 (ite (and (<= 1 64) (<= 64 8))
        ((_ zero_extend 56) (ite (< o2 8)
                            (bvlshr ((_ extract 7 0) o3) ((_ int2bv 8) o2))
                            #x00))
        (ite (and (<= 9 64) (<= 64 16))
        ((_ zero_extend 48) (ite (< o2 16)
                            (bvlshr ((_ extract 15 0) o3) ((_ int2bv 16) o2))
                            #x0000))
        (ite (and (<= 17 64) (<= 64 32))
        ((_ zero_extend 32) (bvlshr ((_ extract 31 0) o3) ((_ int2bv 32) o2)))
        (bvlshr o3 ((_ int2bv 64) o2)))))))
  (=>
  (= bits_manipulation_unsigned__unsigned_64__functions__extract_bits__result (bvand o4 o1))
  (in_range1 (+ (- to__ from) 1)))))))))))))))))))))
(check-sat)
(exit)
