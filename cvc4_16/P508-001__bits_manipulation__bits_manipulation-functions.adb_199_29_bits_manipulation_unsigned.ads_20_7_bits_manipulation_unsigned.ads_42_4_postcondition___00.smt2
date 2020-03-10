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

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

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

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-fun axiom__ (tuple0) Bool)

(declare-fun axiom____function_guard (Bool tuple0) Bool)

;; axiom____post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (=> (= (axiom__ us_void_param) true)
     (forall ((v (_ BitVec 8)))
     (=> (and (bvule #x00 v) (bvule v #xFF))
     (forall ((n Int))
     (=> (and (<= 0 n) (<= n 7))
     (=>
     (= (bvand v (ite (< n 256) (bvshl #x01 ((_ int2bv 8) n)) #x00)) #x00)
     (= (bvand (bvadd v (ite (< n 256) (bvshl #x01 ((_ int2bv 8) n)) #x00)) 
     (ite (< n 256) (bvshl #x01 ((_ int2bv 8) n)) #x00)) (ite (< n 256)
                                                         (bvshl #x01 ((_ int2bv 8) n))
                                                         #x00)))))))) :pattern (
  (axiom__ us_void_param)) )))

(declare-const amount Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort modular 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq (modular modular) Bool)

(declare-const dummy modular)

(declare-datatypes ((modular__ref 0))
(((modular__refqtmk (modular__content modular)))))
(define-fun modular__ref_modular__content__projection ((a modular__ref)) modular 
  (modular__content a))

(define-fun dynamic_invariant ((temp___expr_354 (_ BitVec 8))
  (temp___is_init_350 Bool) (temp___skip_constant_351 Bool)
  (temp___do_toplevel_352 Bool) (temp___do_typ_inv_353 Bool)) Bool true)

(declare-sort mask_size 0)

(declare-fun mask_sizeqtint (mask_size) Int)

;; mask_size'axiom
  (assert
  (forall ((i mask_size))
  (and (<= 1 (mask_sizeqtint i)) (<= (mask_sizeqtint i) 8))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 8)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (mask_size mask_size) Bool)

(declare-const dummy1 mask_size)

(declare-datatypes ((mask_size__ref 0))
(((mask_size__refqtmk (mask_size__content mask_size)))))
(define-fun mask_size__ref_mask_size__content__projection ((a mask_size__ref)) mask_size 
  (mask_size__content a))

(define-fun dynamic_invariant1 ((temp___expr_368 Int)
  (temp___is_init_364 Bool) (temp___skip_constant_365 Bool)
  (temp___do_toplevel_366 Bool)
  (temp___do_typ_inv_367 Bool)) Bool (=>
                                     (or (= temp___is_init_364 true)
                                     (<= 1 8)) (in_range1 temp___expr_368)))

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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((t560s__ref 0))
(((t560s__refqtmk (t560s__content integer)))))
(define-fun t560s__ref_t560s__content__projection ((a t560s__ref)) integer 
  (t560s__content a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(assert
;; defqtvc
 ;; File "bits_manipulation-functions.adb", line 198, characters 0-0
  (not
  (forall ((result__ (_ BitVec 8)) (result__1 (_ BitVec 8))
  (bits_manipulation_unsigned__unsigned_8__functions__proofs__make_mask__lemma2__ones__result (_ BitVec 8))
  (i Int))
  (=> (dynamic_invariant1 amount true false true true)
  (=> (= result__ #x00)
  (=> (dynamic_invariant result__ true false true true)
  (=> (= (axiom__ Tuple0) true)
  (=>
  (let ((temp___543 amount))
  (exists ((i1 Int))
  (and (= i1 1)
  (ite (= (and (ite (<= 1 i1) true false) (ite (<= i1 temp___543) true false)) true)
  (exists ((o (_ BitVec 8)))
  (and
  (let ((temp___544 (- i1 1)))
  (ite (< temp___544 256) (= o (bvshl #x01 ((_ int2bv 8) temp___544)))
  (= o #x00)))
  (exists ((result__2 (_ BitVec 8)))
  (and (= result__2 (bvadd result__ o))
  (exists ((o1 (_ BitVec 8)))
  (and
  (let ((temp___549 (- i1 1)))
  (ite (< temp___549 256) (= o1 (bvshl #x01 ((_ int2bv 8) temp___549)))
  (= o1 #x00)))
  (exists ((o2 (_ BitVec 8)))
  (and
  (let ((temp___548 (- i1 1)))
  (ite (< temp___548 256) (= o2 (bvshl #x01 ((_ int2bv 8) temp___548)))
  (= o2 #x00)))
  (exists ((i2 Int))
  (and
  (= (bvand result__1 (let ((temp___550 (- i2 1)))
                      (ite (< temp___550 256)
                      (bvshl #x01 ((_ int2bv 8) temp___550)) #x00))) 
  (let ((temp___551 (- i2 1)))
  (ite (< temp___551 256) (bvshl #x01 ((_ int2bv 8) temp___551)) #x00)))
  (and
  (= (and (ite (and (dynamic_property 1 amount i2) (dynamic_invariant
               result__1 true true true true))
          true false) (ite (and (<= 1 i2) (<= i2 amount)) true false)) true)
  (= i2 temp___543)))))))))))) (= result__1 result__)))))
  (=>
  (= bits_manipulation_unsigned__unsigned_8__functions__proofs__make_mask__lemma2__ones__result result__1)
  (=> (<= 1 i)
  (=> (<= i amount)
  (= (bvand bits_manipulation_unsigned__unsigned_8__functions__proofs__make_mask__lemma2__ones__result 
  (let ((temp___556 (- i 1)))
  (ite (< temp___556 256) (bvshl #x01 ((_ int2bv 8) temp___556)) #x00))) 
  (let ((temp___557 (- i 1)))
  (ite (< temp___557 256) (bvshl #x01 ((_ int2bv 8) temp___557)) #x00))))))))))))))
(check-sat)
(exit)
