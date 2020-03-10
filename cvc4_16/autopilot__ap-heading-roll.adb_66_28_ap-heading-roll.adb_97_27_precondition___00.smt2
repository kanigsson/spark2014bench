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

(declare-datatypes ((headdegree__ref 0))
(((headdegree__refqtmk (headdegree__content headdegree)))))
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

(declare-datatypes ((machnumber__ref 0))
(((machnumber__refqtmk (machnumber__content machnumber)))))
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

(declare-datatypes ((controlangle__ref 0))
(((controlangle__refqtmk (controlangle__content controlangle)))))
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

(declare-datatypes ((scaledata__ref 0))
(((scaledata__refqtmk (scaledata__content scaledata)))))
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

(declare-datatypes ((degreespersec__ref 0))
(((degreespersec__refqtmk (degreespersec__content degreespersec)))))
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

(declare-datatypes ((bankangle__ref 0))
(((bankangle__refqtmk (bankangle__content bankangle)))))
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

(declare-datatypes ((degreespersec__ref1 0))
(((degreespersec__refqtmk1 (degreespersec__content1 degreespersec1)))))
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

(assert
;; defqtvc
 ;; File "ap-heading-roll.ads", line 7, characters 0-0
  (not
  (forall ((present_rollrate Int) (target_rollrate Int)
  (aileron_movement Int) (target_bank Int) (result__ Int) (result__1 Int)
  (offset Int) (target_angle Int)
  (ada___ada___ada___ap__heading__roll__rate__calc_rollrate__present_rollrate Int)
  (present_rollrate1 Int))
  (=> (dynamic_invariant1 mach true false true true)
  (=> (dynamic_invariant present_heading true false true true)
  (=> (dynamic_invariant target_heading true false true true)
  (=> (dynamic_invariant5 bank true false true true)
  (=> (dynamic_invariant6 present_rollrate false false true true)
  (=> (dynamic_invariant6 target_rollrate false false true true)
  (=> (dynamic_invariant2 aileron_movement false false true true)
  (=> (dynamic_invariant4
  ada___ada___ada___ap__heading__roll__rate__calc_rollrate__present_rollrate
  true true true true)
  (=>
  (= present_rollrate1 ada___ada___ada___ap__heading__roll__rate__calc_rollrate__present_rollrate)
  (=> (= present_heading c11b)
  (=> (dynamic_invariant c11b true false true true)
  (=> (= target_heading c12b)
  (=> (dynamic_invariant c12b true false true true)
  (=> (= bank c13b)
  (=> (dynamic_invariant5 c13b true false true true)
  (=> (dynamic_invariant5 target_bank false false true true)
  (=> (dynamic_invariant6 result__ false false true true)
  (=> (= c11b c16b)
  (=> (dynamic_invariant c16b true false true true)
  (=> (= c12b c17b)
  (=> (dynamic_invariant c17b true false true true)
  (=> (dynamic_invariant5 result__1 false false true true)
  (=> (dynamic_invariant offset false false true true)
  (let ((o c17b))
  (let ((o1 c16b))
  (let ((o2 (heading_offset o1 o)))
  (=>
  (and (heading_offset__function_guard o2 o1 o) (dynamic_invariant o2 true
  false true true))
  (forall ((offset1 Int))
  (=> (= offset1 o2)
  (forall ((spark__branch Bool) (result__2 Int))
  (=>
  (exists ((spark__branch1 Bool))
  (and
  (= spark__branch1 (and (ite (< 40 offset1) true false) (ite (<= offset1 180)
                                                         true false)))
  (ite (= spark__branch1 true)
  (and (= result__2 40) (= spark__branch spark__branch1))
  (exists ((spark__branch2 Bool))
  (and
  (= spark__branch2 (and (ite (< 180 offset1) true false) (ite (< offset1 320)
                                                          true false)))
  (ite (= spark__branch2 true)
  (and (= result__2 (- 40)) (= spark__branch spark__branch2))
  (and (= spark__branch (ite (<= offset1 40) true false))
  (ite (= spark__branch true) (and (in_range6 offset1) (= result__2 offset1))
  (let ((o3 (- 360 offset1))) (and (in_range6 o3) (= result__2 o3)))))))))))
  (forall ((target_bank1 Int))
  (=> (= target_bank1 result__2)
  (forall ((result__3 Int))
  (=> (= result__3 (div1 (- target_bank1 c13b) 5))
  (forall ((result__4 Int))
  (=>
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (< 10 result__3) true false))
  (ite (= spark__branch1 true) (= result__4 10)
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (< result__3 (- 10)) true false))
  (ite (= spark__branch2 true) (= result__4 (- 10)) (= result__4 result__3)))))))
  (forall ((target_rollrate1 Int))
  (=> (= target_rollrate1 result__4)
  (=> (= present_rollrate1 c20b)
  (=> (dynamic_invariant6 c20b true false true true)
  (=> (= target_rollrate1 c21b)
  (=> (dynamic_invariant6 c21b true false true true)
  (=> (= mach c22b)
  (=> (dynamic_invariant1 c22b true false true true)
  (=> (dynamic_invariant2 target_angle false false true true) (< 0 40))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
