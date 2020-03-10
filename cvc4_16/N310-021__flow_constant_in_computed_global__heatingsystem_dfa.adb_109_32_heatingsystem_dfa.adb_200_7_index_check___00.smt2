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

(declare-const hoursinday Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const minutesinhour Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const secondsinminute Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const secondsinhour Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort times 0)

(declare-fun timesqtint (times) Int)

;; times'axiom
  (assert
  (forall ((i times)) (and (<= 0 (timesqtint i)) (<= (timesqtint i) 86399))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 86399)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (times times) Bool)

(declare-const dummy times)

(declare-datatypes ((times__ref 0))
(((times__refqtmk (times__content times)))))
(define-fun times__ref_times__content__projection ((a times__ref)) times 
  (times__content a))

(define-fun to_rep ((x times)) Int (timesqtint x))

(declare-fun of_rep (Int) times)

;; inversion_axiom
  (assert
  (forall ((x times)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x times)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int times))))))
(declare-fun slide ((Array Int times) Int Int) (Array Int times))

;; slide_eq
  (assert
  (forall ((a (Array Int times)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int times)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int times)) (a__first Int) (a__last Int)
  (b (Array Int times)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int times)) (b (Array Int times)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-sort displaydigits 0)

(declare-fun displaydigitsqtint (displaydigits) Int)

;; displaydigits'axiom
  (assert
  (forall ((i displaydigits))
  (and (<= 0 (displaydigitsqtint i)) (<= (displaydigitsqtint i) 9))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 9)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (displaydigits displaydigits) Bool)

(declare-const dummy1 displaydigits)

(declare-datatypes ((displaydigits__ref 0))
(((displaydigits__refqtmk (displaydigits__content displaydigits)))))
(define-fun displaydigits__ref_displaydigits__content__projection ((a displaydigits__ref)) displaydigits 
  (displaydigits__content a))

(define-fun to_rep1 ((x displaydigits)) Int (displaydigitsqtint x))

(declare-fun of_rep1 (Int) displaydigits)

;; inversion_axiom
  (assert
  (forall ((x displaydigits))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x displaydigits)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int displaydigits))))))
(declare-fun slide1 ((Array Int displaydigits) Int
  Int) (Array Int displaydigits))

;; slide_eq
  (assert
  (forall ((a (Array Int displaydigits)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int displaydigits)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int displaydigits)) (a__first Int)
  (a__last Int) (b (Array Int displaydigits)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int displaydigits)) (b (Array Int displaydigits)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-fun currentmode (us_private) Int)

(declare-fun currentmode__function_guard (Int us_private) Bool)

(declare-sort advancemodes 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (advancemodes advancemodes) Bool)

(declare-const dummy2 advancemodes)

(declare-datatypes ((advancemodes__ref 0))
(((advancemodes__refqtmk (advancemodes__content advancemodes)))))
(define-fun advancemodes__ref_advancemodes__content__projection ((a advancemodes__ref)) advancemodes 
  (advancemodes__content a))

(define-fun dynamic_invariant ((temp___expr_253 Int)
  (temp___is_init_249 Bool) (temp___skip_constant_250 Bool)
  (temp___do_toplevel_251 Bool)
  (temp___do_typ_inv_252 Bool)) Bool (=>
                                     (or (= temp___is_init_249 true)
                                     (<= 0 1)) (in_range3 temp___expr_253)))

;; currentmode__post_axiom
  (assert
  (forall ((advancebutton__advancemode us_private))
  (! (let ((result (currentmode advancebutton__advancemode)))
     (=> (currentmode__function_guard result advancebutton__advancemode)
     (dynamic_invariant result true false true true))) :pattern ((currentmode
                                                                 advancebutton__advancemode)) )))

(declare-sort positions 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (positions positions) Bool)

(declare-const dummy3 positions)

(declare-datatypes ((positions__ref 0))
(((positions__refqtmk (positions__content positions)))))
(define-fun positions__ref_positions__content__projection ((a positions__ref)) positions 
  (positions__content a))

(define-fun dynamic_invariant1 ((temp___expr_190 Int)
  (temp___is_init_186 Bool) (temp___skip_constant_187 Bool)
  (temp___do_toplevel_188 Bool)
  (temp___do_typ_inv_189 Bool)) Bool (=>
                                     (or (= temp___is_init_186 true)
                                     (<= 0 5)) (in_range4 temp___expr_190)))

(define-fun dynamic_invariant2 ((temp___expr_183 Int)
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool)
  (temp___do_typ_inv_182 Bool)) Bool (=>
                                     (or (= temp___is_init_179 true)
                                     (<= 0 86399)) (in_range1
                                     temp___expr_183)))

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-const c40b Int)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-const attr__ATTRIBUTE_ADDRESS20 Int)

(declare-sort programtimes 0)

(define-fun in_range5 ((x Int)) Bool (and (<= 2 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (programtimes programtimes) Bool)

(declare-const dummy4 programtimes)

(declare-datatypes ((programtimes__ref 0))
(((programtimes__refqtmk (programtimes__content programtimes)))))
(define-fun programtimes__ref_programtimes__content__projection ((a programtimes__ref)) programtimes 
  (programtimes__content a))

(declare-sort hours 0)

(declare-fun hoursqtint (hours) Int)

;; hours'axiom
  (assert
  (forall ((i hours)) (and (<= 0 (hoursqtint i)) (<= (hoursqtint i) 23))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 23)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (hours hours) Bool)

(declare-const dummy5 hours)

(declare-datatypes ((hours__ref 0))
(((hours__refqtmk (hours__content hours)))))
(define-fun hours__ref_hours__content__3__projection ((a hours__ref)) hours 
  (hours__content a))

(define-fun dynamic_invariant3 ((temp___expr_282 Int)
  (temp___is_init_278 Bool) (temp___skip_constant_279 Bool)
  (temp___do_toplevel_280 Bool)
  (temp___do_typ_inv_281 Bool)) Bool (=>
                                     (or (= temp___is_init_278 true)
                                     (<= 0 23)) (in_range6 temp___expr_282)))

(declare-sort minutes 0)

(declare-fun minutesqtint (minutes) Int)

;; minutes'axiom
  (assert
  (forall ((i minutes))
  (and (<= 0 (minutesqtint i)) (<= (minutesqtint i) 59))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 59)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (minutes minutes) Bool)

(declare-const dummy6 minutes)

(declare-datatypes ((minutes__ref 0))
(((minutes__refqtmk (minutes__content minutes)))))
(define-fun minutes__ref_minutes__content__3__projection ((a minutes__ref)) minutes 
  (minutes__content a))

(define-fun dynamic_invariant4 ((temp___expr_289 Int)
  (temp___is_init_285 Bool) (temp___skip_constant_286 Bool)
  (temp___do_toplevel_287 Bool)
  (temp___do_typ_inv_288 Bool)) Bool (=>
                                     (or (= temp___is_init_285 true)
                                     (<= 0 59)) (in_range7 temp___expr_289)))

(declare-fun temp_____aggregate_def_292 (Int Int Int Int) (Array Int times))

(declare-fun temp_____aggregate_def_299 (Int Int Int
  Int) (Array Int displaydigits))

;; hoursinday__def_axiom
  (assert (= hoursinday 24))

;; minutesinhour__def_axiom
  (assert (= minutesinhour 60))

;; secondsinminute__def_axiom
  (assert (= secondsinminute 60))

;; secondsinhour__def_axiom
  (assert (= secondsinhour 3600))

(define-fun dynamic_invariant5 ((temp___expr_197 Int)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (or (= temp___is_init_193 true)
                                     (<= 2 5)) (in_range5 temp___expr_197)))

(declare-const rliteral times)

;; rliteral_axiom
  (assert (= (timesqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___294 Int) (temp___295 Int) (temp___296 Int)
  (temp___297 Int))
  (let ((temp___293 (temp_____aggregate_def_292 temp___294 temp___295
                    temp___296 temp___297)))
  (=>
  (and
  (and (dynamic_invariant2 temp___294 true true true true)
  (dynamic_invariant2 temp___295 true true true true))
  (and (dynamic_invariant2 temp___296 true true true true)
  (dynamic_invariant2 temp___297 true true true true)))
  (and
  (and (= (select temp___293 2) rliteral) (= (select temp___293 3) rliteral))
  (and (= (select temp___293 4) rliteral) (= (select temp___293 5) rliteral)))))))

(define-fun dynamic_invariant6 ((temp___expr_235 Int)
  (temp___is_init_231 Bool) (temp___skip_constant_232 Bool)
  (temp___do_toplevel_233 Bool)
  (temp___do_typ_inv_234 Bool)) Bool (=>
                                     (or (= temp___is_init_231 true)
                                     (<= 0 9)) (in_range2 temp___expr_235)))

;; def_axiom
  (assert
  (forall ((temp___301 Int) (temp___302 Int) (temp___303 Int)
  (temp___304 Int))
  (let ((temp___300 (temp_____aggregate_def_299 temp___301 temp___302
                    temp___303 temp___304)))
  (=>
  (and
  (and (dynamic_invariant6 temp___301 true true true true)
  (dynamic_invariant6 temp___302 true true true true))
  (and (dynamic_invariant6 temp___303 true true true true)
  (dynamic_invariant6 temp___304 true true true true)))
  (and
  (and (= (to_rep1 (select temp___300 0)) temp___301)
  (= (to_rep1 (select temp___300 1)) temp___302))
  (and (= (to_rep1 (select temp___300 2)) temp___303)
  (= (to_rep1 (select temp___300 3)) temp___304)))))))

(assert
;; defqtvc
 ;; File "heatingsystem_dfa.adb", line 11, characters 0-0
  (not
  (forall ((clockoffset Int) (clockoffset1 Int) (switchposition Int)
  (timer Int) (switchposition1 Int) (spark__branch Bool)
  (spark__branch1 Bool))
  (=> (dynamic_invariant2 hoursinday true false true true)
  (=> (dynamic_invariant2 minutesinhour true false true true)
  (=> (dynamic_invariant2 secondsinminute true false true true)
  (=> (dynamic_invariant2 secondsinhour true false true true)
  (=> (dynamic_invariant2 clockoffset false false true true)
  (=> (dynamic_invariant2 clockoffset1 false true true true)
  (=> (dynamic_invariant1 switchposition false false true true)
  (=> (dynamic_invariant2 timer false false true true)
  (=> (dynamic_invariant1 switchposition1 true true true true)
  (=> (= spark__branch (ite (= switchposition1 0) true false))
  (=> (not (= spark__branch true))
  (=> (= spark__branch1 (ite (= switchposition1 1) true false))
  (=> (not (= spark__branch1 true)) (<= 2 switchposition1)))))))))))))))))
(check-sat)
(exit)
