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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const pitch Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort pitchangle 0)

(declare-fun pitchangleqtint (pitchangle) Int)

;; pitchangle'axiom
  (assert
  (forall ((i pitchangle))
  (and (<= (- 10) (pitchangleqtint i)) (<= (pitchangleqtint i) 20))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 10) x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (pitchangle pitchangle) Bool)

(declare-const dummy1 pitchangle)

(declare-datatypes ()
((pitchangle__ref (pitchangle__refqtmk (pitchangle__content pitchangle)))))
(define-fun pitchangle__ref_pitchangle__content__projection ((a pitchangle__ref)) pitchangle 
  (pitchangle__content a))

(define-fun to_rep ((x pitchangle)) Int (pitchangleqtint x))

(declare-fun of_rep (Int) pitchangle)

;; inversion_axiom
  (assert
  (forall ((x pitchangle))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x pitchangle)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int pitchangle))))))
(declare-fun slide ((Array Int pitchangle) Int Int) (Array Int pitchangle))

;; slide_eq
  (assert
  (forall ((a (Array Int pitchangle)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int pitchangle)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int pitchangle)) (a__first Int) (a__last Int)
  (b (Array Int pitchangle)) (b__first Int)
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
  (forall ((a (Array Int pitchangle)) (b (Array Int pitchangle)))
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

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(define-fun dynamic_invariant1 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= (- 10) 20)) (in_range2
                                     temp___expr_159)))

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

(declare-fun user_eq2 (degreespersec degreespersec) Bool)

(declare-const dummy2 degreespersec)

(declare-datatypes ()
((degreespersec__ref
 (degreespersec__refqtmk (degreespersec__content degreespersec)))))
(define-fun degreespersec__ref_degreespersec__content__projection ((a degreespersec__ref)) degreespersec 
  (degreespersec__content a))

(define-fun dynamic_invariant2 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= (- 180) 180)) (in_range3
                                     temp___expr_166)))

(declare-sort history_range 0)

(declare-fun history_rangeqtint (history_range) Int)

;; history_range'axiom
  (assert
  (forall ((i history_range))
  (and (<= 1 (history_rangeqtint i)) (<= (history_rangeqtint i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (history_range history_range) Bool)

(declare-const dummy3 history_range)

(declare-datatypes ()
((history_range__ref
 (history_range__refqtmk (history_range__content history_range)))))
(define-fun history_range__ref_history_range__content__projection ((a history_range__ref)) history_range 
  (history_range__content a))

(define-fun dynamic_invariant3 ((temp___expr_175 Int)
  (temp___is_init_171 Bool) (temp___skip_constant_172 Bool)
  (temp___do_toplevel_173 Bool)
  (temp___do_typ_inv_174 Bool)) Bool (=>
                                     (or (= temp___is_init_171 true)
                                     (<= 1 10)) (in_range4 temp___expr_175)))

(declare-const present_pitchrate Int)

(declare-const pitch_history_c (Array Int pitchangle))

(declare-const average Int)

(declare-const early_pitch Int)

(declare-const gap Int)

(declare-const average1 Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 pitch true false true true))

;; Assume
  (assert (dynamic_invariant2 present_pitchrate false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 average false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 early_pitch false false true true))

(declare-const sum Int)

;; H
  (assert (= sum 0))

;; Assume
  (assert (dynamic_invariant sum true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant gap false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 average1 false false true true))

(declare-const i Int)

;; H
  (assert (= i 1))

;; H
  (assert
  (= (and (ite (<= 1 i) true false) (ite (<= i 10) true false)) true))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep (select pitch_history_c i)) o))

(define-fun o1 () Int (+ sum o))

;; Ensures
  (assert (in_range1 o1))

(declare-const sum1 Int)

;; H
  (assert (= sum1 o1))

(define-fun o2 () Int (* i (- 10)))

;; Ensures
  (assert (in_range1 o2))

(define-fun o3 () Int (* i 20))

;; Ensures
  (assert (in_range1 o3))

(assert
;; defqtvc
 ;; File "ap-altitude-pitch-rate.ads", line 8, characters 0-0
  (not (<= sum1 (* i 20))))
(check-sat)
