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

(declare-const present_altitude Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const target_altitude Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const mach Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const climb_rate Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const the_pitch Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun scale_movement (Int Int Int Int) Int)

(declare-fun scale_movement__function_guard (Int Int Int Int Int) Bool)

(declare-sort machnumber 0)

(declare-fun machnumberqtint (machnumber) Int)

;; machnumber'axiom
  (assert
  (forall ((i machnumber))
  (and (<= 0 (machnumberqtint i)) (<= (machnumberqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (machnumber machnumber) Bool)

(declare-const dummy machnumber)

(declare-datatypes ((machnumber__ref 0))
(((machnumber__refqtmk (machnumber__content machnumber)))))
(define-fun machnumber__ref_machnumber__content__projection ((a machnumber__ref)) machnumber 
  (machnumber__content a))

(define-fun dynamic_invariant ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 100)) (in_range1 temp___expr_166)))

(declare-sort controlangle 0)

(declare-fun controlangleqtint (controlangle) Int)

;; controlangle'axiom
  (assert
  (forall ((i controlangle))
  (and (<= (- 45) (controlangleqtint i)) (<= (controlangleqtint i) 45))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 45) x) (<= x 45)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (controlangle controlangle) Bool)

(declare-const dummy1 controlangle)

(declare-datatypes ((controlangle__ref 0))
(((controlangle__refqtmk (controlangle__content controlangle)))))
(define-fun controlangle__ref_controlangle__content__projection ((a controlangle__ref)) controlangle 
  (controlangle__content a))

(define-fun dynamic_invariant1 ((temp___expr_208 Int)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (or (= temp___is_init_204 true)
                                     (<= (- 45) 45)) (in_range2
                                     temp___expr_208)))

(declare-sort scaledata 0)

(declare-fun scaledataqtint (scaledata) Int)

;; scaledata'axiom
  (assert
  (forall ((i scaledata))
  (and (<= (- 100) (scaledataqtint i)) (<= (scaledataqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 100) x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (scaledata scaledata) Bool)

(declare-const dummy2 scaledata)

(declare-datatypes ((scaledata__ref 0))
(((scaledata__refqtmk (scaledata__content scaledata)))))
(define-fun scaledata__ref_scaledata__content__projection ((a scaledata__ref)) scaledata 
  (scaledata__content a))

(define-fun dynamic_invariant2 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= (- 100) 100)) (in_range3
                                     temp___expr_215)))

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

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort degreespersec 0)

(declare-fun degreespersecqtint (degreespersec) Int)

;; degreespersec'axiom
  (assert
  (forall ((i degreespersec))
  (and (<= (- 180) (degreespersecqtint i)) (<= (degreespersecqtint i) 180))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 180) x) (<= x 180)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (degreespersec degreespersec) Bool)

(declare-const dummy3 degreespersec)

(declare-datatypes ((degreespersec__ref 0))
(((degreespersec__refqtmk (degreespersec__content degreespersec)))))
(define-fun degreespersec__ref_degreespersec__content__projection ((a degreespersec__ref)) degreespersec 
  (degreespersec__content a))

(define-fun dynamic_invariant3 ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= (- 180) 180)) (in_range4
                                     temp___expr_194)))

(declare-const c11b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const c12b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const c13b Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const c16b Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const c17b Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-const c20b Int)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const c21b Int)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const c22b Int)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-const attr__ATTRIBUTE_ADDRESS20 Int)

(declare-sort feet 0)

(declare-fun feetqtint (feet) Int)

;; feet'axiom
  (assert
  (forall ((i feet)) (and (<= 0 (feetqtint i)) (<= (feetqtint i) 50000))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 50000)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (feet feet) Bool)

(declare-const dummy4 feet)

(declare-datatypes ((feet__ref 0))
(((feet__refqtmk (feet__content feet)))))
(define-fun feet__ref_feet__content__projection ((a feet__ref)) feet 
  (feet__content a))

(define-fun dynamic_invariant4 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 50000)) (in_range5
                                     temp___expr_159)))

(declare-sort feetpermin 0)

(declare-fun feetperminqtint (feetpermin) Int)

;; feetpermin'axiom
  (assert
  (forall ((i feetpermin))
  (and (<= (- 6000) (feetperminqtint i)) (<= (feetperminqtint i) 6000))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 6000) x) (<= x 6000)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (feetpermin feetpermin) Bool)

(declare-const dummy5 feetpermin)

(declare-datatypes ((feetpermin__ref 0))
(((feetpermin__refqtmk (feetpermin__content feetpermin)))))
(define-fun feetpermin__ref_feetpermin__content__projection ((a feetpermin__ref)) feetpermin 
  (feetpermin__content a))

(define-fun dynamic_invariant5 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= (- 6000) 6000)) (in_range6
                                     temp___expr_173)))

(declare-sort pitchangle 0)

(declare-fun pitchangleqtint (pitchangle) Int)

;; pitchangle'axiom
  (assert
  (forall ((i pitchangle))
  (and (<= (- 10) (pitchangleqtint i)) (<= (pitchangleqtint i) 20))))

(define-fun in_range7 ((x Int)) Bool (and (<= (- 10) x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (pitchangle pitchangle) Bool)

(declare-const dummy6 pitchangle)

(declare-datatypes ((pitchangle__ref 0))
(((pitchangle__refqtmk (pitchangle__content pitchangle)))))
(define-fun pitchangle__ref_pitchangle__content__projection ((a pitchangle__ref)) pitchangle 
  (pitchangle__content a))

(define-fun dynamic_invariant6 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= (- 10) 20)) (in_range7
                                     temp___expr_180)))

(declare-sort floorfpm 0)

(declare-fun floorfpmqtint (floorfpm) Int)

;; floorfpm'axiom
  (assert
  (forall ((i floorfpm))
  (and (<= (- 1000) (floorfpmqtint i)) (<= (floorfpmqtint i) 1000))))

(define-fun in_range8 ((x Int)) Bool (and (<= (- 1000) x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq7 (floorfpm floorfpm) Bool)

(declare-const dummy7 floorfpm)

(declare-datatypes ((floorfpm__ref 0))
(((floorfpm__refqtmk (floorfpm__content floorfpm)))))
(define-fun floorfpm__ref_floorfpm__content__projection ((a floorfpm__ref)) floorfpm 
  (floorfpm__content a))

(define-fun dynamic_invariant7 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= (- 1000) 1000)) (in_range8
                                     temp___expr_187)))

(declare-sort degreespersec1 0)

(declare-fun degreespersecqtint1 (degreespersec1) Int)

;; degreespersec'axiom
  (assert
  (forall ((i degreespersec1))
  (and (<= (- 180) (degreespersecqtint1 i)) (<= (degreespersecqtint1 i) 180))))

(define-fun in_range9 ((x Int)) Bool (and (<= (- 180) x) (<= x 180)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq8 (degreespersec1 degreespersec1) Bool)

(declare-const dummy8 degreespersec1)

(declare-datatypes ((degreespersec__ref1 0))
(((degreespersec__refqtmk1 (degreespersec__content1 degreespersec1)))))
(define-fun degreespersec__ref_degreespersec__content__2__projection ((a degreespersec__ref1)) degreespersec1 
  (degreespersec__content1 a))

(define-fun dynamic_invariant8 ((temp___expr_201 Int)
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool)
  (temp___do_typ_inv_200 Bool)) Bool (=>
                                     (or (= temp___is_init_197 true)
                                     (<= (- 180) 180)) (in_range9
                                     temp___expr_201)))

;; c11b__def_axiom
  (assert (= c11b present_altitude))

;; c12b__def_axiom
  (assert (= c12b target_altitude))

;; c13b__def_axiom
  (assert (= c13b climb_rate))

;; c16b__def_axiom
  (assert (= c16b c11b))

;; c17b__def_axiom
  (assert (= c17b c12b))

;; c22b__def_axiom
  (assert (= c22b mach))

(assert
;; defqtvc
 ;; File "ap-altitude-pitch.ads", line 7, characters 0-0
  (not
  (forall ((present_pitchrate Int) (target_pitchrate Int)
  (elevator_movement Int) (target_climb_rate Int) (floor_climb_rate Int)
  (result__ Int) (result__1 Int)
  (ada___ada___ada___ap__altitude__pitch__rate__calc_pitchrate__present_pitchrate Int))
  (=> (dynamic_invariant4 present_altitude true false true true)
  (=> (dynamic_invariant4 target_altitude true false true true)
  (=> (dynamic_invariant mach true false true true)
  (=> (dynamic_invariant5 climb_rate true false true true)
  (=> (dynamic_invariant6 the_pitch true false true true)
  (=> (dynamic_invariant8 present_pitchrate false false true true)
  (=> (dynamic_invariant8 target_pitchrate false false true true)
  (=> (dynamic_invariant1 elevator_movement false false true true)
  (=> (dynamic_invariant3
  ada___ada___ada___ap__altitude__pitch__rate__calc_pitchrate__present_pitchrate
  true true true true)
  (=> (= present_altitude c11b)
  (=> (dynamic_invariant4 c11b true false true true)
  (=> (= target_altitude c12b)
  (=> (dynamic_invariant4 c12b true false true true)
  (=> (= climb_rate c13b)
  (=> (dynamic_invariant5 c13b true false true true)
  (=> (dynamic_invariant7 target_climb_rate false false true true)
  (=> (dynamic_invariant7 floor_climb_rate false false true true)
  (=> (dynamic_invariant8 result__ false false true true)
  (=> (= c11b c16b)
  (=> (dynamic_invariant4 c16b true false true true)
  (=> (= c12b c17b)
  (=> (dynamic_invariant4 c17b true false true true)
  (=> (dynamic_invariant5 result__1 false false true true)
  (let ((o (div1 (- c17b c16b) 10)))
  (=> (in_range6 o)
  (forall ((result__2 Int))
  (=> (= result__2 o)
  (forall ((spark__branch Bool) (result__3 Int))
  (=>
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (< 1000 result__2) true false))
  (ite (= spark__branch1 true)
  (and (= result__3 1000) (= spark__branch spark__branch1))
  (and (= spark__branch (ite (< result__2 (- 1000)) true false))
  (ite (= spark__branch true) (= result__3 (- 1000)) (= result__3 result__2))))))
  (in_range8 result__3)))))))))))))))))))))))))))))))))
(check-sat)
(exit)
