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

(declare-const mach Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const slip Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun scale_movement (Int Int Int Int) Int)

(declare-fun scale_movement__function_guard (Int Int Int Int Int) Bool)

(declare-sort machnumber 0)

(declare-fun machnumberqtint (machnumber) Int)

;; machnumber'axiom
  (assert
  (forall ((i machnumber))
  (and (<= 0 (machnumberqtint i)) (<= (machnumberqtint i) 100))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (machnumber machnumber) Bool)

(declare-const dummy machnumber)

(declare-datatypes ()
((machnumber__ref (machnumber__refqtmk (machnumber__content machnumber)))))
(define-fun machnumber__ref_machnumber__content__projection ((a machnumber__ref)) machnumber 
  (machnumber__content a))

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 100)) (in_range temp___expr_159)))

(declare-sort controlangle 0)

(declare-fun controlangleqtint (controlangle) Int)

;; controlangle'axiom
  (assert
  (forall ((i controlangle))
  (and (<= (- 45) (controlangleqtint i)) (<= (controlangleqtint i) 45))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 45) x) (<= x 45)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (controlangle controlangle) Bool)

(declare-const dummy1 controlangle)

(declare-datatypes ()
((controlangle__ref
 (controlangle__refqtmk (controlangle__content controlangle)))))
(define-fun controlangle__ref_controlangle__content__projection ((a controlangle__ref)) controlangle 
  (controlangle__content a))

(define-fun dynamic_invariant1 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= (- 45) 45)) (in_range1
                                     temp___expr_187)))

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

(declare-fun user_eq2 (scaledata scaledata) Bool)

(declare-const dummy2 scaledata)

(declare-datatypes ()
((scaledata__ref (scaledata__refqtmk (scaledata__content scaledata)))))
(define-fun scaledata__ref_scaledata__content__projection ((a scaledata__ref)) scaledata 
  (scaledata__content a))

(define-fun dynamic_invariant2 ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= (- 100) 100)) (in_range2
                                     temp___expr_194)))

;; scale_movement__post_axiom
  (assert
  (forall ((mach1 Int) (present Int) (target Int) (max Int))
  (! (=>
     (and
     (and
     (and
     (and (dynamic_invariant mach1 true true true true) (dynamic_invariant2
     present true true true true)) (dynamic_invariant2 target true true true
     true)) (dynamic_invariant1 max true true true true)) (< 0 max))
     (let ((result (scale_movement mach1 present target max)))
     (=> (scale_movement__function_guard result mach1 present target max)
     (and (and (<= (- max) result) (<= result max)) (dynamic_invariant1
     result true false true true))))) :pattern ((scale_movement mach1 present
                                                target max)) )))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort degreespersec 0)

(declare-fun degreespersecqtint (degreespersec) Int)

;; degreespersec'axiom
  (assert
  (forall ((i degreespersec))
  (and (<= (- 180) (degreespersecqtint i)) (<= (degreespersecqtint i) 180))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 180) x) (<= x 180)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (degreespersec degreespersec) Bool)

(declare-const dummy3 degreespersec)

(declare-datatypes ()
((degreespersec__ref
 (degreespersec__refqtmk (degreespersec__content degreespersec)))))
(define-fun degreespersec__ref_degreespersec__content__projection ((a degreespersec__ref)) degreespersec 
  (degreespersec__content a))

(define-fun dynamic_invariant3 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= (- 180) 180)) (in_range3
                                     temp___expr_173)))

(declare-const c3b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const c4b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort slipangle 0)

(declare-fun slipangleqtint (slipangle) Int)

;; slipangle'axiom
  (assert
  (forall ((i slipangle))
  (and (<= (- 25) (slipangleqtint i)) (<= (slipangleqtint i) 25))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 25) x) (<= x 25)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (slipangle slipangle) Bool)

(declare-const dummy4 slipangle)

(declare-datatypes ()
((slipangle__ref (slipangle__refqtmk (slipangle__content slipangle)))))
(define-fun slipangle__ref_slipangle__content__projection ((a slipangle__ref)) slipangle 
  (slipangle__content a))

(define-fun dynamic_invariant4 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= (- 25) 25)) (in_range4
                                     temp___expr_166)))

(declare-sort degreespersec1 0)

(declare-fun degreespersecqtint1 (degreespersec1) Int)

;; degreespersec'axiom
  (assert
  (forall ((i degreespersec1))
  (and (<= (- 180) (degreespersecqtint1 i)) (<= (degreespersecqtint1 i) 180))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 180) x) (<= x 180)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (degreespersec1 degreespersec1) Bool)

(declare-const dummy5 degreespersec1)

(declare-datatypes ()
((degreespersec__ref1
 (degreespersec__refqtmk1 (degreespersec__content1 degreespersec1)))))
(define-fun degreespersec__ref_degreespersec__content__2__projection ((a degreespersec__ref1)) degreespersec1 
  (degreespersec__content1 a))

(define-fun dynamic_invariant5 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= (- 180) 180)) (in_range5
                                     temp___expr_180)))

;; c4b__def_axiom
  (assert (= c4b mach))

(declare-const present_sliprate Int)

(declare-const rudder_movement Int)

(declare-const target_angle Int)

;; Assume
  (assert (dynamic_invariant mach true false true true))

;; Assume
  (assert (dynamic_invariant4 slip true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant5 present_sliprate false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 rudder_movement false false true true))

(declare-const ada___ada___ada___ap__heading__yaw__rate__calc_yawrate__present_yawrate Int)

;; Ensures
  (assert (dynamic_invariant3
  ada___ada___ada___ap__heading__yaw__rate__calc_yawrate__present_yawrate
  true true true true))

(declare-const present_sliprate1 Int)

;; H
  (assert
  (= present_sliprate1 ada___ada___ada___ap__heading__yaw__rate__calc_yawrate__present_yawrate))

;; Assume
  (assert (= present_sliprate1 c3b))

;; Assume
  (assert (dynamic_invariant5 c3b true false true true))

;; Assume
  (assert (= mach c4b))

;; Assume
  (assert (dynamic_invariant c4b true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 target_angle false false true true))

(define-fun o () Int (div1 c3b 2))

(define-fun o1 () Int c4b)

(assert
;; defqtvc
 ;; File "ap-heading-yaw.ads", line 7, characters 0-0
  (not (< 0 20)))
(check-sat)
