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

(declare-fun nth ((_ BitVec 64) Int) Bool)

(declare-fun lsr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2int x)
                                            (- (- 18446744073709551616 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 64))))))
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

(declare-fun to_address ((_ BitVec 64)) (_ BitVec 64))

(declare-fun to_address__function_guard ((_ BitVec 64) (_ BitVec 64)) Bool)

(declare-sort address 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 64))

(declare-fun user_eq1 (address address) Bool)

(declare-const dummy1 address)

(declare-datatypes ()
((address__ref (address__refqtmk (address__content address)))))
(define-fun address__ref_address__content__projection ((a address__ref)) address 
  (address__content a))

(define-fun dynamic_invariant1 ((temp___expr_183 (_ BitVec 64))
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool) (temp___do_typ_inv_182 Bool)) Bool true)

(declare-sort integer_address 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

(declare-fun user_eq2 (integer_address integer_address) Bool)

(declare-const dummy2 integer_address)

(declare-datatypes ()
((integer_address__ref
 (integer_address__refqtmk (integer_address__content integer_address)))))
(define-fun integer_address__ref_integer_address__content__projection ((a integer_address__ref)) integer_address 
  (integer_address__content a))

(define-fun dynamic_invariant2 ((temp___expr_190 (_ BitVec 64))
  (temp___is_init_186 Bool) (temp___skip_constant_187 Bool)
  (temp___do_toplevel_188 Bool) (temp___do_typ_inv_189 Bool)) Bool true)

;; to_address__post_axiom
  (assert
  (forall ((value (_ BitVec 64)))
  (! (=> (dynamic_invariant2 value true true true true) (dynamic_invariant1
     (to_address value) true false true true)) :pattern ((to_address value)) )))

(declare-const buffer (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (natural natural) Bool)

(declare-const dummy3 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant3 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-fun zero (tuple0) Int)

(declare-fun zero__function_guard (Int tuple0) Bool)

;; zero__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (zero us_void_param)))
     (=> (zero__function_guard result us_void_param) (dynamic_invariant3
     result true false true true))) :pattern ((zero us_void_param)) )))

;; zero__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (zero us_void_param) 0) :pattern ((zero us_void_param)) )))

(declare-fun omod ((_ BitVec 64) Int) Int)

(declare-fun omod__function_guard (Int (_ BitVec 64) Int) Bool)

(declare-sort storage_offset 0)

(declare-fun storage_offsetqtint (storage_offset) Int)

;; storage_offset'axiom
  (assert
  (forall ((i storage_offset))
  (and (<= (- 9223372036854775808) (storage_offsetqtint i))
  (<= (storage_offsetqtint i) 9223372036854775807))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (storage_offset storage_offset) Bool)

(declare-const dummy4 storage_offset)

(declare-datatypes ()
((storage_offset__ref
 (storage_offset__refqtmk (storage_offset__content storage_offset)))))
(define-fun storage_offset__ref_storage_offset__content__projection ((a storage_offset__ref)) storage_offset 
  (storage_offset__content a))

(define-fun dynamic_invariant4 ((temp___expr_197 Int)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (or (= temp___is_init_193 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range2 temp___expr_197)))

;; omod__post_axiom
  (assert
  (forall ((left (_ BitVec 64)))
  (forall ((right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant4
     right true true true true)) (dynamic_invariant4 (omod left right) true
     false true true)) :pattern ((omod left right)) ))))

(declare-fun oadd ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun oadd__function_guard ((_ BitVec 64) (_ BitVec 64) Int) Bool)

;; oadd__post_axiom
  (assert
  (forall ((left (_ BitVec 64)))
  (forall ((right Int))
  (! (=>
     (and (dynamic_invariant1 left true true true true) (dynamic_invariant4
     right true true true true)) (dynamic_invariant1 (oadd left right) true
     false true true)) :pattern ((oadd left right)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

;; buffer__def_axiom
  (assert (= buffer (to_address #x0000000000000000)))

(declare-const asp Int)

(declare-const cla Int)

(define-fun pixel__buffer__assume () (_ BitVec 64) (to_address
                                                   #x0000000000000000))

;; Ensures
  (assert (dynamic_invariant1 pixel__buffer__assume true false true true))

;; Assume
  (assert (= pixel__buffer__assume buffer))

;; Assume
  (assert (dynamic_invariant1 buffer true false true true))

;; Assume
  (assert (dynamic_invariant asp false false true true))

(define-fun o () Int (zero Tuple0))

;; H
  (assert (zero__function_guard o Tuple0))

;; H
  (assert (dynamic_invariant3 o true false true true))

;; H
  (assert (= o 0))

(assert
;; defqtvc
 ;; File "pixel.adb", line 3, characters 0-0
  (not (not (= o 0))))
(check-sat)

(exit)
