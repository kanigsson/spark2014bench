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
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

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

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

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

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 Float32)))))
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

(declare-sort float__ 0)

(declare-fun user_eq1 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy1 float__)

(declare-datatypes ()
((float____ref (float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant1 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun convert ((_ BitVec 32)) Float32)

(declare-fun convert__function_guard (Float32 (_ BitVec 32)) Bool)

(declare-sort source 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 32))

(declare-fun user_eq2 (source source) Bool)

(declare-const dummy2 source)

(declare-datatypes ()
((source__ref (source__refqtmk (source__content source)))))
(define-fun source__ref_source__content__2__projection ((a source__ref)) source 
  (source__content a))

(define-fun dynamic_invariant2 ((temp___expr_205 (_ BitVec 32))
  (temp___is_init_201 Bool) (temp___skip_constant_202 Bool)
  (temp___do_toplevel_203 Bool) (temp___do_typ_inv_204 Bool)) Bool true)

(declare-sort target 0)

(declare-fun user_eq3 (target target) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy3 target)

(declare-datatypes ()
((target__ref (target__refqtmk (target__content target)))))
(define-fun target__ref_target__content__2__projection ((a target__ref)) target 
  (target__content a))

(define-fun dynamic_invariant3 ((temp___expr_212 Float32)
  (temp___is_init_208 Bool) (temp___skip_constant_209 Bool)
  (temp___do_toplevel_210 Bool)
  (temp___do_typ_inv_211 Bool)) Bool (=>
                                     (or (= temp___is_init_208 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_212)))

;; convert__post_axiom
  (assert
  (forall ((s (_ BitVec 32)))
  (! (=> (dynamic_invariant2 s true true true true)
     (let ((result (convert s)))
     (=> (convert__function_guard result s) (dynamic_invariant3 result true
     false true true)))) :pattern ((convert s)) )))

(declare-const zero_plus Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const zero_neg Float32)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c1b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const c2b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun magic (Float32) Int)

(declare-fun magic__function_guard (Int Float32) Bool)

(declare-sort source1 0)

(declare-fun user_eq4 (source1 source1) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float32)

(declare-const dummy4 source1)

(declare-datatypes ()
((source__ref1 (source__refqtmk1 (source__content1 source1)))))
(define-fun source__ref_source__content__3__projection ((a source__ref1)) source1 
  (source__content1 a))

(define-fun dynamic_invariant4 ((temp___expr_219 Float32)
  (temp___is_init_215 Bool) (temp___skip_constant_216 Bool)
  (temp___do_toplevel_217 Bool)
  (temp___do_typ_inv_218 Bool)) Bool (=>
                                     (or (= temp___is_init_215 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_219)))

(declare-sort target1 0)

(declare-fun targetqtint (target1) Int)

;; target'axiom
  (assert
  (forall ((i target1))
  (and (<= (- 2147483648) (targetqtint i)) (<= (targetqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (target1 target1) Bool)

(declare-const dummy5 target1)

(declare-datatypes ()
((target__ref1 (target__refqtmk1 (target__content1 target1)))))
(define-fun target__ref_target__content__3__projection ((a target__ref1)) target1 
  (target__content1 a))

(define-fun dynamic_invariant5 ((temp___expr_226 Int)
  (temp___is_init_222 Bool) (temp___skip_constant_223 Bool)
  (temp___do_toplevel_224 Bool)
  (temp___do_typ_inv_225 Bool)) Bool (=>
                                     (or (= temp___is_init_222 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_226)))

;; magic__post_axiom
  (assert
  (forall ((s Float32))
  (! (=> (dynamic_invariant4 s true true true true)
     (let ((result (magic s)))
     (=> (magic__function_guard result s) (dynamic_invariant5 result true
     false true true)))) :pattern ((magic s)) )))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

;; zero_plus__def_axiom
  (assert
  (and (convert__function_guard (convert #x00000000) #x00000000)
  (= zero_plus (convert #x00000000))))

;; zero_neg__def_axiom
  (assert
  (and (convert__function_guard (convert #x80000000) #x80000000)
  (= zero_neg (convert #x80000000))))

;; c1b__def_axiom
  (assert (= c1b zero_plus))

;; c2b__def_axiom
  (assert (= c2b zero_neg))

(declare-const x Int)

(define-fun zero_and_unchecked__zero_plus__assume () Float32 (convert
                                                             #x00000000))

;; H
  (assert (convert__function_guard zero_and_unchecked__zero_plus__assume
  #x00000000))

;; H
  (assert (dynamic_invariant3 zero_and_unchecked__zero_plus__assume true
  false true true))

;; Assume
  (assert (= zero_and_unchecked__zero_plus__assume zero_plus))

;; Assume
  (assert (dynamic_invariant1 zero_plus true false true true))

(define-fun zero_and_unchecked__zero_neg__assume () Float32 (convert
                                                            #x80000000))

;; H
  (assert (convert__function_guard zero_and_unchecked__zero_neg__assume
  #x80000000))

;; H
  (assert (dynamic_invariant3 zero_and_unchecked__zero_neg__assume true false
  true true))

;; Assume
  (assert (= zero_and_unchecked__zero_neg__assume zero_neg))

;; Assume
  (assert (dynamic_invariant1 zero_neg true false true true))

;; Assume
  (assert (= zero_plus c1b))

;; Assume
  (assert (dynamic_invariant1 c1b true false true true))

;; Assume
  (assert (= zero_neg c2b))

;; Assume
  (assert (dynamic_invariant1 c2b true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant x false false true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (fp.eq c1b c2b) true false)))

;; H
  (assert (= spark__branch true))

(define-fun o () Float32 c2b)

(define-fun o1 () Int (magic o))

;; H
  (assert (magic__function_guard o1 o))

;; H
  (assert (dynamic_invariant5 o1 true false true true))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (= o1 0) false true)))

;; H
  (assert (= spark__branch1 true))

(define-fun o2 () Float32 c1b)

(define-fun o3 () Int (magic o2))

;; H
  (assert (magic__function_guard o3 o2))

;; H
  (assert (dynamic_invariant5 o3 true false true true))

(assert
;; defqtvc
 ;; File "zero_and_unchecked.adb", line 5, characters 0-0
  (not (not (= o3 0))))
(check-sat)
