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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-fun sign (Int) Int)

(declare-fun sign__function_guard (Int Int) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort small_integer 0)

(declare-fun small_integerqtint (small_integer) Int)

;; small_integer'axiom
  (assert
  (forall ((i small_integer))
  (and (<= (- 10000) (small_integerqtint i))
  (<= (small_integerqtint i) 10000))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 10000) x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (small_integer small_integer) Bool)

(declare-const dummy3 small_integer)

(declare-datatypes ((small_integer__ref 0))
(((small_integer__refqtmk (small_integer__content small_integer)))))
(define-fun small_integer__ref_small_integer__content__projection ((a small_integer__ref)) small_integer 
  (small_integer__content a))

(declare-sort small_natural 0)

(declare-fun small_naturalqtint (small_natural) Int)

;; small_natural'axiom
  (assert
  (forall ((i small_natural))
  (and (<= 0 (small_naturalqtint i)) (<= (small_naturalqtint i) 10000))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (small_natural small_natural) Bool)

(declare-const dummy4 small_natural)

(declare-datatypes ((small_natural__ref 0))
(((small_natural__refqtmk (small_natural__content small_natural)))))
(define-fun small_natural__ref_small_natural__content__projection ((a small_natural__ref)) small_natural 
  (small_natural__content a))

(declare-sort small_positive 0)

(declare-fun small_positiveqtint (small_positive) Int)

;; small_positive'axiom
  (assert
  (forall ((i small_positive))
  (and (<= 1 (small_positiveqtint i)) (<= (small_positiveqtint i) 10000))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (small_positive small_positive) Bool)

(declare-const dummy5 small_positive)

(declare-datatypes ((small_positive__ref 0))
(((small_positive__refqtmk (small_positive__content small_positive)))))
(define-fun small_positive__ref_small_positive__content__projection ((a small_positive__ref)) small_positive 
  (small_positive__content a))

(declare-sort very_small_natural 0)

(declare-fun very_small_naturalqtint (very_small_natural) Int)

;; very_small_natural'axiom
  (assert
  (forall ((i very_small_natural))
  (and (<= 0 (very_small_naturalqtint i))
  (<= (very_small_naturalqtint i) 50))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 50)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (very_small_natural very_small_natural) Bool)

(declare-const dummy6 very_small_natural)

(declare-datatypes ((very_small_natural__ref 0))
(((very_small_natural__refqtmk
  (very_small_natural__content very_small_natural)))))
(define-fun very_small_natural__ref_very_small_natural__content__projection ((a very_small_natural__ref)) very_small_natural 
  (very_small_natural__content a))

(declare-sort very_small_positive 0)

(declare-fun very_small_positiveqtint (very_small_positive) Int)

;; very_small_positive'axiom
  (assert
  (forall ((i very_small_positive))
  (and (<= 1 (very_small_positiveqtint i))
  (<= (very_small_positiveqtint i) 50))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 50)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (very_small_positive very_small_positive) Bool)

(declare-const dummy7 very_small_positive)

(declare-datatypes ((very_small_positive__ref 0))
(((very_small_positive__refqtmk
  (very_small_positive__content very_small_positive)))))
(define-fun very_small_positive__ref_very_small_positive__content__projection ((a very_small_positive__ref)) very_small_positive 
  (very_small_positive__content a))

(declare-sort very_very_small_natural 0)

(declare-fun very_very_small_naturalqtint (very_very_small_natural) Int)

;; very_very_small_natural'axiom
  (assert
  (forall ((i very_very_small_natural))
  (and (<= 0 (very_very_small_naturalqtint i))
  (<= (very_very_small_naturalqtint i) 5))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (very_very_small_natural very_very_small_natural) Bool)

(declare-const dummy8 very_very_small_natural)

(declare-datatypes ((very_very_small_natural__ref 0))
(((very_very_small_natural__refqtmk
  (very_very_small_natural__content very_very_small_natural)))))
(define-fun very_very_small_natural__ref_very_very_small_natural__content__projection ((a very_very_small_natural__ref)) very_very_small_natural 
  (very_very_small_natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= (- 10000) 10000)) (in_range3
                                     temp___expr_180)))

(define-fun dynamic_invariant4 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 10000)) (in_range4
                                     temp___expr_187)))

(define-fun dynamic_invariant5 ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= 1 10000)) (in_range5
                                     temp___expr_194)))

(declare-sort sign_t 0)

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (sign_t sign_t) Bool)

(declare-const dummy9 sign_t)

(declare-datatypes ((sign_t__ref 0))
(((sign_t__refqtmk (sign_t__content sign_t)))))
(define-fun sign_t__ref_sign_t__content__projection ((a sign_t__ref)) sign_t 
  (sign_t__content a))

(define-fun dynamic_invariant6 ((temp___expr_201 Int)
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool)
  (temp___do_typ_inv_200 Bool)) Bool (=>
                                     (or (= temp___is_init_197 true)
                                     (<= 0 2)) (in_range9 temp___expr_201)))

;; sign__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (sign x)))
     (=> (sign__function_guard result x) (dynamic_invariant6 result true
     false true true)))) :pattern ((sign x)) )))

;; sign__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (= (sign x) (ite (< x 0) 0 (ite (= x 0) 1 2)))) :pattern ((sign x)) )))

(define-fun dynamic_invariant7 ((temp___expr_232 Int)
  (temp___is_init_228 Bool) (temp___skip_constant_229 Bool)
  (temp___do_toplevel_230 Bool)
  (temp___do_typ_inv_231 Bool)) Bool (=>
                                     (or (= temp___is_init_228 true)
                                     (<= 0 50)) (in_range6 temp___expr_232)))

(define-fun dynamic_invariant8 ((temp___expr_239 Int)
  (temp___is_init_235 Bool) (temp___skip_constant_236 Bool)
  (temp___do_toplevel_237 Bool)
  (temp___do_typ_inv_238 Bool)) Bool (=>
                                     (or (= temp___is_init_235 true)
                                     (<= 1 50)) (in_range7 temp___expr_239)))

(define-fun dynamic_invariant9 ((temp___expr_246 Int)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (=>
                                     (or (= temp___is_init_242 true)
                                     (<= 0 5)) (in_range8 temp___expr_246)))

(assert
;; defqtvc
 ;; File "test_arith.adb", line 3, characters 0-0
  (not
  (forall ((x Int) (y Int) (z Int) (r Int) (s Int) (r1 Int) (x1 Int) (y1 Int)
  (r2 Int) (x2 Int) (y2 Int) (r3 Int) (x3 Int) (y3 Int) (r4 Int) (x4 Int)
  (y4 Int))
  (=> (dynamic_invariant x false false true true)
  (=> (dynamic_invariant y false false true true)
  (=> (dynamic_invariant z false false true true)
  (=> (dynamic_invariant r false false true true)
  (=> (dynamic_invariant s false false true true)
  (=> (= r1 0)
  (=> (dynamic_invariant r1 true true true true)
  (=> (= x1 1)
  (=> (= y1 1)
  (=> (in_range5 y1)
  (=> (in_range5 x1)
  (=> (<= x1 r2)
  (=> (<= y1 r2)
  (=> (dynamic_invariant r2 true true true true)
  (=> (= x2 0)
  (=> (= y2 1)
  (=> (in_range3 y2)
  (=> (in_range3 x2)
  (=> (=> (= r3 0) (or (= x2 0) (= y2 0)))
  (=> (dynamic_invariant r3 true true true true)
  (=> (= x3 1)
  (=> (= y3 1)
  (=> (in_range3 y3)
  (=> (in_range3 x3)
  (=> (=> (= r4 0) (or (= x3 0) (= y3 0)))
  (=> (dynamic_invariant r4 true true true true)
  (=> (= x4 45)
  (=> (= y4 234)
  (=> (in_range4 y4)
  (let ((o (+ x4 34)))
  (=> (in_range o)
  (=> (in_range4 o)
  (=> (in_range4 x4)
  (forall ((r5 Int) (s1 Int))
  (=>
  (and (<= r5 s1)
  (and (dynamic_invariant r5 true true true true) (dynamic_invariant s1 true
  true true true)))
  (forall ((x5 Int))
  (=> (= x5 45)
  (forall ((y5 Int))
  (=> (= y5 234)
  (=> (in_range5 y5)
  (let ((o1 (+ x5 34)))
  (=> (in_range o1)
  (=> (in_range4 o1)
  (=> (in_range4 x5)
  (forall ((r6 Int) (s2 Int))
  (=>
  (and (< r6 s2)
  (and (dynamic_invariant r6 true true true true) (dynamic_invariant s2 true
  true true true)))
  (forall ((x6 Int))
  (=> (= x6 45)
  (forall ((y6 Int))
  (=> (= y6 234)
  (let ((o2 (+ y6 1)))
  (=> (in_range o2)
  (=> (in_range5 o2)
  (=> (in_range4 y6)
  (=> (in_range4 x6)
  (forall ((r7 Int))
  (=>
  (and (and (<= 0 r7) (<= r7 x6)) (dynamic_invariant r7 true true true true))
  (forall ((x7 Int))
  (=> (= x7 45)
  (forall ((y7 Int))
  (=> (= y7 (- 234))
  (forall ((z1 Int))
  (=> (= z1 (- 2))
  (=> (in_range3 z1)
  (=> (in_range3 y7)
  (=> (in_range3 x7)
  (forall ((r8 Int) (s3 Int))
  (=>
  (and (= r8 s3)
  (and (dynamic_invariant r8 true true true true) (dynamic_invariant s3 true
  true true true)))
  (forall ((x8 Int))
  (=> (= x8 24)
  (forall ((y8 Int))
  (=> (= y8 45)
  (forall ((r9 Int))
  (=>
  (and (and (<= x8 r9) (<= r9 y8)) (dynamic_invariant r9 true true true
  true))
  (forall ((x9 Int))
  (=> (= x9 45)
  (forall ((y9 Int))
  (=> (= y9 24)
  (=> (in_range5 y9)
  (=> (in_range3 x9)
  (forall ((r10 Int))
  (=>
  (and (=> (= r10 0) (< x9 (abs1 y9))) (dynamic_invariant r10 true true true
  true))
  (forall ((x10 Int))
  (=> (= x10 24)
  (forall ((y10 Int))
  (=> (= y10 45)
  (=> (in_range5 y10)
  (=> (in_range3 x10)
  (forall ((r11 Int))
  (=>
  (and (=> (= r11 0) (< x10 (abs1 y10))) (dynamic_invariant r11 true true
  true true))
  (forall ((x11 Int))
  (=> (= x11 24)
  (forall ((y11 Int))
  (=> (= y11 45)
  (forall ((z2 Int))
  (=> (= z2 3)
  (=> (in_range5 z2)
  (=> (in_range4 y11)
  (=> (in_range4 x11)
  (forall ((r12 Int) (s4 Int))
  (=>
  (and (<= r12 s4)
  (and (dynamic_invariant r12 true true true true) (dynamic_invariant s4 true
  true true true)))
  (forall ((x12 Int))
  (=> (= x12 24)
  (forall ((y12 Int))
  (=> (= y12 45)
  (=> (in_range5 y12)
  (=> (in_range5 x12)
  (forall ((r13 Int))
  (=> (and (= r13 x12) (dynamic_invariant r13 true true true true))
  (forall ((x13 Int))
  (=> (= x13 24)
  (forall ((y13 Int))
  (=> (= y13 45)
  (=> (in_range5 y13)
  (=> (in_range1 x13)
  (forall ((r14 Int))
  (=>
  (and (and (<= (+ (- x13 y13) 1) r14) (<= r14 x13)) (dynamic_invariant r14
  true true true true))
  (forall ((x14 Int))
  (=> (= x14 24)
  (forall ((y14 Int))
  (=> (= y14 45)
  (forall ((z3 Int))
  (=> (= z3 2046)
  (=> (in_range1 z3)
  (=> (in_range2 y14)
  (=> (in_range1 x14)
  (forall ((r15 Int))
  (=> (and (<= r15 z3) (dynamic_invariant r15 true true true true))
  (forall ((x15 Int))
  (=> (= x15 (- 2356))
  (forall ((y15 Int))
  (=> (= y15 (- 45))
  (=> (in_range3 y15) (=> (in_range3 x15) (not (= y15 0)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
