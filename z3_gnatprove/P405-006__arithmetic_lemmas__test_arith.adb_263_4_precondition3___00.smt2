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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
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

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
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

(declare-datatypes ()
((small_integer__ref
 (small_integer__refqtmk (small_integer__content small_integer)))))
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

(declare-datatypes ()
((small_natural__ref
 (small_natural__refqtmk (small_natural__content small_natural)))))
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

(declare-datatypes ()
((small_positive__ref
 (small_positive__refqtmk (small_positive__content small_positive)))))
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

(declare-datatypes ()
((very_small_natural__ref
 (very_small_natural__refqtmk
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

(declare-datatypes ()
((very_small_positive__ref
 (very_small_positive__refqtmk
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

(declare-datatypes ()
((very_very_small_natural__ref
 (very_very_small_natural__refqtmk
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

(declare-datatypes ()
((sign_t__ref (sign_t__refqtmk (sign_t__content sign_t)))))
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

(declare-const x Int)

(declare-const y Int)

(declare-const z Int)

(declare-const r Int)

(declare-const s Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant x false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant y false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant z false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant r false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant s false false true true))

(declare-const x1 Int)

;; H
  (assert (= x1 0))

(declare-const y1 Int)

;; H
  (assert (= y1 1))

(declare-const r1 Int)

;; H
  (assert (= r1 0))

;; H
  (assert (dynamic_invariant r1 true true true true))

(declare-const x2 Int)

;; H
  (assert (= x2 1))

(declare-const y2 Int)

;; H
  (assert (= y2 1))

;; Ensures
  (assert (in_range5 y2))

;; Ensures
  (assert (in_range5 x2))

(declare-const r2 Int)

;; H
  (assert (<= x2 r2))

;; H
  (assert (<= y2 r2))

;; H
  (assert (dynamic_invariant r2 true true true true))

(declare-const x3 Int)

;; H
  (assert (= x3 0))

(declare-const y3 Int)

;; H
  (assert (= y3 1))

;; Ensures
  (assert (in_range3 y3))

;; Ensures
  (assert (in_range3 x3))

(declare-const r3 Int)

;; H
  (assert (=> (= r3 0) (or (= x3 0) (= y3 0))))

;; H
  (assert (dynamic_invariant r3 true true true true))

(declare-const x4 Int)

;; H
  (assert (= x4 1))

(declare-const y4 Int)

;; H
  (assert (= y4 1))

;; Ensures
  (assert (in_range3 y4))

;; Ensures
  (assert (in_range3 x4))

(declare-const r4 Int)

;; H
  (assert (=> (= r4 0) (or (= x4 0) (= y4 0))))

;; H
  (assert (dynamic_invariant r4 true true true true))

(declare-const x5 Int)

;; H
  (assert (= x5 45))

(declare-const y5 Int)

;; H
  (assert (= y5 234))

;; Ensures
  (assert (in_range4 y5))

(define-fun o () Int (+ x5 34))

;; Ensures
  (assert (in_range o))

;; Ensures
  (assert (in_range4 o))

;; Ensures
  (assert (in_range4 x5))

(declare-const r5 Int)

(declare-const s1 Int)

;; H
  (assert (<= r5 s1))

;; H
  (assert (dynamic_invariant r5 true true true true))

;; H
  (assert (dynamic_invariant s1 true true true true))

(declare-const x6 Int)

;; H
  (assert (= x6 45))

(declare-const y6 Int)

;; H
  (assert (= y6 234))

;; Ensures
  (assert (in_range5 y6))

(define-fun o1 () Int (+ x6 34))

;; Ensures
  (assert (in_range o1))

;; Ensures
  (assert (in_range4 o1))

;; Ensures
  (assert (in_range4 x6))

(declare-const r6 Int)

(declare-const s2 Int)

;; H
  (assert (< r6 s2))

;; H
  (assert (dynamic_invariant r6 true true true true))

;; H
  (assert (dynamic_invariant s2 true true true true))

(declare-const x7 Int)

;; H
  (assert (= x7 45))

(declare-const y7 Int)

;; H
  (assert (= y7 234))

(define-fun o2 () Int (+ y7 1))

;; Ensures
  (assert (in_range o2))

;; Ensures
  (assert (in_range5 o2))

;; Ensures
  (assert (in_range4 y7))

;; Ensures
  (assert (in_range4 x7))

(declare-const r7 Int)

;; H
  (assert (<= 0 r7))

;; H
  (assert (<= r7 x7))

;; H
  (assert (dynamic_invariant r7 true true true true))

(declare-const x8 Int)

;; H
  (assert (= x8 45))

(declare-const y8 Int)

;; H
  (assert (= y8 (- 234)))

(declare-const z1 Int)

;; H
  (assert (= z1 (- 2)))

;; Ensures
  (assert (in_range3 z1))

;; Ensures
  (assert (in_range3 y8))

;; Ensures
  (assert (in_range3 x8))

(declare-const r8 Int)

(declare-const s3 Int)

;; H
  (assert (= r8 s3))

;; H
  (assert (dynamic_invariant r8 true true true true))

;; H
  (assert (dynamic_invariant s3 true true true true))

(declare-const x9 Int)

;; H
  (assert (= x9 24))

(declare-const y9 Int)

;; H
  (assert (= y9 45))

(declare-const r9 Int)

;; H
  (assert (<= x9 r9))

;; H
  (assert (<= r9 y9))

;; H
  (assert (dynamic_invariant r9 true true true true))

(declare-const x10 Int)

;; H
  (assert (= x10 45))

(declare-const y10 Int)

;; H
  (assert (= y10 24))

;; Ensures
  (assert (in_range5 y10))

;; Ensures
  (assert (in_range3 x10))

(declare-const r10 Int)

;; H
  (assert (=> (= r10 0) (< x10 (abs1 y10))))

;; H
  (assert (dynamic_invariant r10 true true true true))

(declare-const x11 Int)

;; H
  (assert (= x11 24))

(declare-const y11 Int)

;; H
  (assert (= y11 45))

;; Ensures
  (assert (in_range5 y11))

;; Ensures
  (assert (in_range3 x11))

(declare-const r11 Int)

;; H
  (assert (=> (= r11 0) (< x11 (abs1 y11))))

;; H
  (assert (dynamic_invariant r11 true true true true))

(declare-const x12 Int)

;; H
  (assert (= x12 24))

(declare-const y12 Int)

;; H
  (assert (= y12 45))

(declare-const z2 Int)

;; H
  (assert (= z2 3))

;; Ensures
  (assert (in_range5 z2))

;; Ensures
  (assert (in_range4 y12))

;; Ensures
  (assert (in_range4 x12))

(declare-const r12 Int)

(declare-const s4 Int)

;; H
  (assert (<= r12 s4))

;; H
  (assert (dynamic_invariant r12 true true true true))

;; H
  (assert (dynamic_invariant s4 true true true true))

(declare-const x13 Int)

;; H
  (assert (= x13 24))

(declare-const y13 Int)

;; H
  (assert (= y13 45))

;; Ensures
  (assert (in_range5 y13))

;; Ensures
  (assert (in_range5 x13))

(declare-const r13 Int)

;; H
  (assert (= r13 x13))

;; H
  (assert (dynamic_invariant r13 true true true true))

(declare-const x14 Int)

;; H
  (assert (= x14 24))

(declare-const y14 Int)

;; H
  (assert (= y14 45))

;; Ensures
  (assert (in_range5 y14))

;; Ensures
  (assert (in_range1 x14))

(declare-const r14 Int)

;; H
  (assert (<= (+ (- x14 y14) 1) r14))

;; H
  (assert (<= r14 x14))

;; H
  (assert (dynamic_invariant r14 true true true true))

(declare-const x15 Int)

;; H
  (assert (= x15 24))

(declare-const y15 Int)

;; H
  (assert (= y15 45))

(declare-const z3 Int)

;; H
  (assert (= z3 2046))

;; Ensures
  (assert (in_range1 z3))

;; Ensures
  (assert (in_range2 y15))

;; Ensures
  (assert (in_range1 x15))

(assert
;; defqtvc
 ;; File "test_arith.adb", line 3, characters 0-0
  (not (<= x15 (div1 z3 y15))))
(check-sat)
