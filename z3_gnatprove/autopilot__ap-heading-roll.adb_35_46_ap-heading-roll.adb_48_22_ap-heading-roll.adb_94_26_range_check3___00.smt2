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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const mach Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const present_heading Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const target_heading Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const bank Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun heading_offset (Int Int) Int)

(declare-fun heading_offset__function_guard (Int Int Int) Bool)

(declare-sort headdegree 0)

(declare-fun headdegreeqtint (headdegree) Int)

;; headdegree'axiom
  (assert
  (forall ((i headdegree))
  (and (<= 0 (headdegreeqtint i)) (<= (headdegreeqtint i) 359))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 359)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (headdegree headdegree) Bool)

(declare-const dummy headdegree)

(declare-datatypes ()
((headdegree__ref (headdegree__refqtmk (headdegree__content headdegree)))))
(define-fun headdegree__ref_headdegree__content__projection ((a headdegree__ref)) headdegree 
  (headdegree__content a))

(define-fun dynamic_invariant ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 0 359)) (in_range1 temp___expr_167)))

;; heading_offset__post_axiom
  (assert
  (forall ((present Int) (target Int))
  (! (=>
     (and (dynamic_invariant present true true true true) (dynamic_invariant
     target true true true true))
     (let ((result (heading_offset present target)))
     (=> (heading_offset__function_guard result present target)
     (dynamic_invariant result true false true true)))) :pattern ((heading_offset
                                                                  present
                                                                  target)) )))

(declare-fun scale_movement (Int Int Int Int) Int)

(declare-fun scale_movement__function_guard (Int Int Int Int Int) Bool)

(declare-sort machnumber 0)

(declare-fun machnumberqtint (machnumber) Int)

;; machnumber'axiom
  (assert
  (forall ((i machnumber))
  (and (<= 0 (machnumberqtint i)) (<= (machnumberqtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (machnumber machnumber) Bool)

(declare-const dummy1 machnumber)

(declare-datatypes ()
((machnumber__ref (machnumber__refqtmk (machnumber__content machnumber)))))
(define-fun machnumber__ref_machnumber__content__projection ((a machnumber__ref)) machnumber 
  (machnumber__content a))

(define-fun dynamic_invariant1 ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 0 100)) (in_range2 temp___expr_160)))

(declare-sort controlangle 0)

(declare-fun controlangleqtint (controlangle) Int)

;; controlangle'axiom
  (assert
  (forall ((i controlangle))
  (and (<= (- 45) (controlangleqtint i)) (<= (controlangleqtint i) 45))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 45) x) (<= x 45)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (controlangle controlangle) Bool)

(declare-const dummy2 controlangle)

(declare-datatypes ()
((controlangle__ref
 (controlangle__refqtmk (controlangle__content controlangle)))))
(define-fun controlangle__ref_controlangle__content__projection ((a controlangle__ref)) controlangle 
  (controlangle__content a))

(define-fun dynamic_invariant2 ((temp___expr_195 Int)
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool)
  (temp___do_typ_inv_194 Bool)) Bool (=>
                                     (or (= temp___is_init_191 true)
                                     (<= (- 45) 45)) (in_range3
                                     temp___expr_195)))

(declare-sort scaledata 0)

(declare-fun scaledataqtint (scaledata) Int)

;; scaledata'axiom
  (assert
  (forall ((i scaledata))
  (and (<= (- 100) (scaledataqtint i)) (<= (scaledataqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 100) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (scaledata scaledata) Bool)

(declare-const dummy3 scaledata)

(declare-datatypes ()
((scaledata__ref (scaledata__refqtmk (scaledata__content scaledata)))))
(define-fun scaledata__ref_scaledata__content__projection ((a scaledata__ref)) scaledata 
  (scaledata__content a))

(define-fun dynamic_invariant3 ((temp___expr_202 Int)
  (temp___is_init_198 Bool) (temp___skip_constant_199 Bool)
  (temp___do_toplevel_200 Bool)
  (temp___do_typ_inv_201 Bool)) Bool (=>
                                     (or (= temp___is_init_198 true)
                                     (<= (- 100) 100)) (in_range4
                                     temp___expr_202)))

;; scale_movement__post_axiom
  (assert
  (forall ((mach1 Int) (present Int) (target Int) (max Int))
  (! (=>
     (and
     (and
     (and
     (and (dynamic_invariant1 mach1 true true true true) (dynamic_invariant3
     present true true true true)) (dynamic_invariant3 target true true true
     true)) (dynamic_invariant2 max true true true true)) (< 0 max))
     (let ((result (scale_movement mach1 present target max)))
     (=> (scale_movement__function_guard result mach1 present target max)
     (and (and (<= (- max) result) (<= result max)) (dynamic_invariant2
     result true false true true))))) :pattern ((scale_movement mach1 present
                                                target max)) )))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort degreespersec 0)

(declare-fun degreespersecqtint (degreespersec) Int)

;; degreespersec'axiom
  (assert
  (forall ((i degreespersec))
  (and (<= (- 180) (degreespersecqtint i)) (<= (degreespersecqtint i) 180))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 180) x) (<= x 180)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (degreespersec degreespersec) Bool)

(declare-const dummy4 degreespersec)

(declare-datatypes ()
((degreespersec__ref
 (degreespersec__refqtmk (degreespersec__content degreespersec)))))
(define-fun degreespersec__ref_degreespersec__content__projection ((a degreespersec__ref)) degreespersec 
  (degreespersec__content a))

(define-fun dynamic_invariant4 ((temp___expr_181 Int)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (or (= temp___is_init_177 true)
                                     (<= (- 180) 180)) (in_range5
                                     temp___expr_181)))

(declare-const c11b Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const c12b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const c13b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const c16b Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const c17b Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const c20b Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-const c21b Int)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const c22b Int)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-sort bankangle 0)

(declare-fun bankangleqtint (bankangle) Int)

;; bankangle'axiom
  (assert
  (forall ((i bankangle))
  (and (<= (- 45) (bankangleqtint i)) (<= (bankangleqtint i) 45))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 45) x) (<= x 45)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (bankangle bankangle) Bool)

(declare-const dummy5 bankangle)

(declare-datatypes ()
((bankangle__ref (bankangle__refqtmk (bankangle__content bankangle)))))
(define-fun bankangle__ref_bankangle__content__projection ((a bankangle__ref)) bankangle 
  (bankangle__content a))

(define-fun dynamic_invariant5 ((temp___expr_174 Int)
  (temp___is_init_170 Bool) (temp___skip_constant_171 Bool)
  (temp___do_toplevel_172 Bool)
  (temp___do_typ_inv_173 Bool)) Bool (=>
                                     (or (= temp___is_init_170 true)
                                     (<= (- 45) 45)) (in_range6
                                     temp___expr_174)))

(declare-sort degreespersec1 0)

(declare-fun degreespersecqtint1 (degreespersec1) Int)

;; degreespersec'axiom
  (assert
  (forall ((i degreespersec1))
  (and (<= (- 180) (degreespersecqtint1 i)) (<= (degreespersecqtint1 i) 180))))

(define-fun in_range7 ((x Int)) Bool (and (<= (- 180) x) (<= x 180)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (degreespersec1 degreespersec1) Bool)

(declare-const dummy6 degreespersec1)

(declare-datatypes ()
((degreespersec__ref1
 (degreespersec__refqtmk1 (degreespersec__content1 degreespersec1)))))
(define-fun degreespersec__ref_degreespersec__content__2__projection ((a degreespersec__ref1)) degreespersec1 
  (degreespersec__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_188 Int)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (or (= temp___is_init_184 true)
                                     (<= (- 180) 180)) (in_range7
                                     temp___expr_188)))

;; c11b__def_axiom
  (assert (= c11b present_heading))

;; c12b__def_axiom
  (assert (= c12b target_heading))

;; c13b__def_axiom
  (assert (= c13b bank))

;; c16b__def_axiom
  (assert (= c16b c11b))

;; c17b__def_axiom
  (assert (= c17b c12b))

;; c22b__def_axiom
  (assert (= c22b mach))

(declare-const present_rollrate Int)

(declare-const target_rollrate Int)

(declare-const aileron_movement Int)

(declare-const target_bank Int)

(declare-const result__ Int)

(declare-const result__1 Int)

(declare-const offset Int)

(declare-const target_angle Int)

;; Assume
  (assert (dynamic_invariant1 mach true false true true))

;; Assume
  (assert (dynamic_invariant present_heading true false true true))

;; Assume
  (assert (dynamic_invariant target_heading true false true true))

;; Assume
  (assert (dynamic_invariant5 bank true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant6 present_rollrate false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant6 target_rollrate false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 aileron_movement false false true true))

(declare-const ada___ada___ada___ap__heading__roll__rate__calc_rollrate__present_rollrate Int)

;; Ensures
  (assert (dynamic_invariant4
  ada___ada___ada___ap__heading__roll__rate__calc_rollrate__present_rollrate
  true true true true))

(declare-const present_rollrate1 Int)

;; H
  (assert
  (= present_rollrate1 ada___ada___ada___ap__heading__roll__rate__calc_rollrate__present_rollrate))

;; Assume
  (assert (= present_heading c11b))

;; Assume
  (assert (dynamic_invariant c11b true false true true))

;; Assume
  (assert (= target_heading c12b))

;; Assume
  (assert (dynamic_invariant c12b true false true true))

;; Assume
  (assert (= bank c13b))

;; Assume
  (assert (dynamic_invariant5 c13b true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant5 target_bank false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant6 result__ false false true true))

;; Assume
  (assert (= c11b c16b))

;; Assume
  (assert (dynamic_invariant c16b true false true true))

;; Assume
  (assert (= c12b c17b))

;; Assume
  (assert (dynamic_invariant c17b true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant5 result__1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant offset false false true true))

(define-fun o () Int c17b)

(define-fun o1 () Int c16b)

(define-fun o2 () Int (heading_offset o1 o))

;; H
  (assert (heading_offset__function_guard o2 o1 o))

;; H
  (assert (dynamic_invariant o2 true false true true))

(declare-const offset1 Int)

;; H
  (assert (= offset1 o2))

(declare-const spark__branch Bool)

;; H
  (assert
  (= spark__branch (and (ite (< 40 offset1) true false) (ite (<= offset1 180)
                                                        true false))))

;; H
  (assert (not (= spark__branch true)))

(declare-const spark__branch1 Bool)

;; H
  (assert
  (= spark__branch1 (and (ite (< 180 offset1) true false) (ite (< offset1 320)
                                                          true false))))

;; H
  (assert (not (= spark__branch1 true)))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (<= offset1 40) true false)))

;; H
  (assert (not (= spark__branch2 true)))

(assert
;; defqtvc
 ;; File "ap-heading-roll.ads", line 7, characters 0-0
  (not (in_range6 (- 360 offset1))))
(check-sat)
