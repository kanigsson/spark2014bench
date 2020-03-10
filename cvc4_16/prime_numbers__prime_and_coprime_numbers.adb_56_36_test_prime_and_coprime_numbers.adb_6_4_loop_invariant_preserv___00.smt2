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

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-fun are_coprime (Int Int) Bool)

(declare-fun are_coprime__function_guard (Bool Int Int) Bool)

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

(declare-sort value_type 0)

(declare-fun value_typeqtint (value_type) Int)

;; value_type'axiom
  (assert
  (forall ((i value_type))
  (and (<= 0 (value_typeqtint i)) (<= (value_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (value_type value_type) Bool)

(declare-const dummy value_type)

(declare-datatypes ((value_type__ref 0))
(((value_type__refqtmk (value_type__content value_type)))))
(define-fun value_type__ref_value_type__content__projection ((a value_type__ref)) value_type 
  (value_type__content a))

(define-fun dynamic_invariant ((temp___expr_200 Int)
  (temp___is_init_196 Bool) (temp___skip_constant_197 Bool)
  (temp___do_toplevel_198 Bool)
  (temp___do_typ_inv_199 Bool)) Bool (=>
                                     (or (= temp___is_init_196 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_200)))

;; are_coprime__post_axiom
  (assert true)

;; are_coprime__def_axiom
  (assert
  (forall ((v1 Int) (v2 Int))
  (! (= (= (are_coprime v1 v2) true)
     (and (and (< 0 v1) (< 0 v2))
     (forall ((v Int))
     (=> (and (<= 2 v) (<= v (min v1 v2)))
     (not (and (= (mod2 v1 v) 0) (= (mod2 v2 v) 0))))))) :pattern ((are_coprime
                                                                   v1 v2)) )))

(declare-const left Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort taS 0)

(declare-fun taSqtint (taS) Int)

;; taS'axiom
  (assert
  (forall ((i taS)) (and (<= 1 (taSqtint i)) (<= (taSqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (taS taS) Bool)

(declare-const dummy1 taS)

(declare-datatypes ((taS__ref 0))
(((taS__refqtmk (taS__content taS)))))
(define-fun taS__ref_taS__content__projection ((a taS__ref)) taS (taS__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_239 Int)
  (temp___is_init_235 Bool) (temp___skip_constant_236 Bool)
  (temp___do_toplevel_237 Bool)
  (temp___do_typ_inv_238 Bool)) Bool (=>
                                     (or (= temp___is_init_235 true)
                                     (<= 1 2147483647)) (in_range2
                                     temp___expr_239)))

(declare-sort tbS 0)

(declare-fun tbSqtint (tbS) Int)

;; tbS'axiom
  (assert
  (forall ((i tbS)) (and (<= 1 (tbSqtint i)) (<= (tbSqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tbS tbS) Bool)

(declare-const dummy2 tbS)

(declare-datatypes ((tbS__ref 0))
(((tbS__refqtmk (tbS__content tbS)))))
(define-fun tbS__ref_tbS__content__projection ((a tbS__ref)) tbS (tbS__content
                                                                 a))

(define-fun dynamic_invariant2 ((temp___expr_246 Int)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (=>
                                     (or (= temp___is_init_242 true)
                                     (<= 1 2147483647)) (in_range3
                                     temp___expr_246)))

(declare-sort trS 0)

(declare-fun trSqtint (trS) Int)

;; trS'axiom
  (assert
  (forall ((i trS)) (and (<= 0 (trSqtint i)) (<= (trSqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (trS trS) Bool)

(declare-const dummy3 trS)

(declare-datatypes ((trS__ref 0))
(((trS__refqtmk (trS__content trS)))))
(define-fun trS__ref_trS__content__projection ((a trS__ref)) trS (trS__content
                                                                 a))

(define-fun dynamic_invariant3 ((temp___expr_253 Int)
  (temp___is_init_249 Bool) (temp___skip_constant_250 Bool)
  (temp___do_toplevel_251 Bool)
  (temp___do_typ_inv_252 Bool)) Bool (=>
                                     (or (= temp___is_init_249 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_253)))

(assert
;; defqtvc
 ;; File "prime_and_coprime_numbers.adb", line 29, characters 0-0
  (not
  (forall ((a Int) (b Int) (r Int))
  (=> (dynamic_invariant left true false true true)
  (=> (dynamic_invariant right true false true true)
  (=> (<= 2 left)
  (=> (<= 0 right)
  (=> (are_coprime__function_guard (are_coprime left right) left right)
  (=> (dynamic_invariant1 a false false true true)
  (=> (dynamic_invariant2 b false false true true)
  (=> (dynamic_invariant3 r false false true true)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (= left 0) true false))
  (=> (not (= spark__branch true))
  (forall ((spark__branch1 Bool))
  (=> (= spark__branch1 (ite (= right 0) true false))
  (=> (not (= spark__branch1 true))
  (let ((o left))
  (=> (in_range2 o)
  (forall ((a1 Int))
  (=> (= a1 o)
  (let ((o1 right))
  (=> (in_range3 o1)
  (forall ((b1 Int))
  (=> (= b1 o1)
  (forall ((a2 Int) (b2 Int) (r1 Int))
  (=>
  (forall ((a3 Int) (b3 Int)) (are_coprime__function_guard
  (are_coprime a3 b3) a3 b3))
  (=> (are_coprime__function_guard (are_coprime left right) left right)
  (=>
  (and (and (< 0 a2) (< 0 b2))
  (and (not (and (= a2 1) (= b2 1)))
  (= (= (are_coprime a2 b2) true) (= (are_coprime left right) true))))
  (=>
  (and
  (and (dynamic_invariant2 b2 false true true true) (dynamic_invariant3 r1
  false true true true)) (dynamic_invariant1 a2 false true true true))
  (let ((o2 (mod2 a2 b2)))
  (=> (in_range4 o2)
  (forall ((r2 Int))
  (=> (= r2 o2)
  (=> (not (= r2 0))
  (=>
  (forall ((a3 Int) (b3 Int)) (are_coprime__function_guard
  (are_coprime a3 b3) a3 b3))
  (=>
  (forall ((b3 Int) (r3 Int)) (are_coprime__function_guard
  (are_coprime b3 r3) b3 r3))
  (=> (= (= (are_coprime a2 b2) true) (= (are_coprime b2 r2) true))
  (forall ((a3 Int))
  (=> (= a3 b2)
  (=> (in_range3 r2) (forall ((b3 Int)) (=> (= b3 r2) (< 0 a3))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
