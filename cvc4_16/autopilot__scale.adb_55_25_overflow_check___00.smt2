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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const mach Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const present Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const target Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const max Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun inverse (Int Int) Int)

(declare-fun inverse__function_guard (Int Int Int) Bool)

(declare-sort scaledata 0)

(declare-fun scaledataqtint (scaledata) Int)

;; scaledata'axiom
  (assert
  (forall ((i scaledata))
  (and (<= (- 100) (scaledataqtint i)) (<= (scaledataqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 100) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (scaledata scaledata) Bool)

(declare-const dummy1 scaledata)

(declare-datatypes ((scaledata__ref 0))
(((scaledata__refqtmk (scaledata__content scaledata)))))
(define-fun scaledata__ref_scaledata__content__projection ((a scaledata__ref)) scaledata 
  (scaledata__content a))

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= (- 100) 100)) (in_range2
                                     temp___expr_161)))

(declare-sort percent 0)

(declare-fun percentqtint (percent) Int)

;; percent'axiom
  (assert
  (forall ((i percent))
  (and (<= 0 (percentqtint i)) (<= (percentqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (percent percent) Bool)

(declare-const dummy2 percent)

(declare-datatypes ((percent__ref 0))
(((percent__refqtmk (percent__content percent)))))
(define-fun percent__ref_percent__content__projection ((a percent__ref)) percent 
  (percent__content a))

(define-fun dynamic_invariant2 ((temp___expr_196 Int)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (or (= temp___is_init_192 true)
                                     (<= 0 100)) (in_range3 temp___expr_196)))

;; inverse__post_axiom
  (assert
  (forall ((val__ Int) (flatness Int))
  (! (=>
     (and
     (and (dynamic_invariant1 val__ true true true true) (dynamic_invariant
     flatness true true true true))
     (and (and (<= 0 val__) (< 0 flatness)) (<= flatness 100)))
     (let ((result (inverse val__ flatness)))
     (=> (inverse__function_guard result val__ flatness) (dynamic_invariant2
     result true false true true)))) :pattern ((inverse val__ flatness)) )))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort controlangle 0)

(declare-fun controlangleqtint (controlangle) Int)

;; controlangle'axiom
  (assert
  (forall ((i controlangle))
  (and (<= (- 45) (controlangleqtint i)) (<= (controlangleqtint i) 45))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 45) x) (<= x 45)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (controlangle controlangle) Bool)

(declare-const dummy3 controlangle)

(declare-datatypes ((controlangle__ref 0))
(((controlangle__refqtmk (controlangle__content controlangle)))))
(define-fun controlangle__ref_controlangle__content__projection ((a controlangle__ref)) controlangle 
  (controlangle__content a))

(define-fun dynamic_invariant3 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= (- 45) 45)) (in_range4
                                     temp___expr_168)))

(declare-sort machnumber 0)

(declare-fun machnumberqtint (machnumber) Int)

;; machnumber'axiom
  (assert
  (forall ((i machnumber))
  (and (<= 0 (machnumberqtint i)) (<= (machnumberqtint i) 100))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (machnumber machnumber) Bool)

(declare-const dummy4 machnumber)

(declare-datatypes ((machnumber__ref 0))
(((machnumber__refqtmk (machnumber__content machnumber)))))
(define-fun machnumber__ref_machnumber__content__projection ((a machnumber__ref)) machnumber 
  (machnumber__content a))

(define-fun dynamic_invariant4 ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= 0 100)) (in_range5 temp___expr_175)))

(assert
;; defqtvc
 ;; File "scale.ads", line 9, characters 0-0
  (not
  (forall ((target_angle Int) (k1 Int) (k2 Int) (gap Int)
  (spark__branch Bool) (gap1 Int))
  (=> (dynamic_invariant4 mach true false true true)
  (=> (dynamic_invariant1 present true false true true)
  (=> (dynamic_invariant1 target true false true true)
  (=> (dynamic_invariant3 max true false true true)
  (=> (< 0 max)
  (=> (dynamic_invariant3 target_angle false false true true)
  (=> (dynamic_invariant k1 false false true true)
  (=> (dynamic_invariant k2 false false true true)
  (=> (dynamic_invariant gap false false true true)
  (=> (= spark__branch (ite (= present target) true false))
  (=> (not (= spark__branch true))
  (=> (< 0 gap1)
  (=> (<= gap1 100)
  (=> (dynamic_invariant gap1 false true true true)
  (let ((o mach))
  (let ((o1 (inverse o 20)))
  (=>
  (and (inverse__function_guard o1 o 20) (dynamic_invariant2 o1 true false
  true true))
  (forall ((k11 Int))
  (=> (= k11 o1)
  (=> (in_range2 gap1)
  (let ((o2 (inverse gap1 20)))
  (=>
  (and (inverse__function_guard o2 gap1 20) (dynamic_invariant2 o2 true false
  true true))
  (forall ((k21 Int))
  (=> (= k21 o2)
  (let ((o3 (+ 1 k21))) (=> (in_range1 o3) (in_range1 (+ o3 k11)))))))))))))))))))))))))))))))
(check-sat)
(exit)
