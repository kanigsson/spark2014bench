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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
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
  (forall ((a (Array Int integer)) (b (Array Int integer)))
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

(declare-fun all_elements_in ((Array Int integer) Int) Bool)

(declare-fun all_elements_in__function_guard (Bool (Array Int integer)
  Int) Bool)

;; all_elements_in__post_axiom
  (assert true)

;; all_elements_in__def_axiom
  (assert
  (forall ((a (Array Int integer)))
  (forall ((max Int))
  (! (= (= (all_elements_in a max) true)
     (forall ((k Int))
     (=> (and (<= 0 k) (<= k 7))
     (let ((temp___179 (to_rep (select a k))))
     (and (<= (- max) temp___179) (<= temp___179 max)))))) :pattern (
  (all_elements_in a max)) ))))

(declare-fun all_left_elements_in ((Array Int integer) Int Int) Bool)

(declare-fun all_left_elements_in__function_guard (Bool (Array Int integer)
  Int Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; all_left_elements_in__post_axiom
  (assert true)

;; all_left_elements_in__def_axiom
  (assert
  (forall ((a (Array Int integer)))
  (forall ((right Int) (max Int))
  (! (= (= (all_left_elements_in a right max) true)
     (forall ((k Int))
     (=> (and (<= 0 k) (<= k 7))
     (=> (< k right)
     (let ((temp___183 (to_rep (select a k))))
     (and (<= (- max) temp___183) (<= temp___183 max))))))) :pattern (
  (all_left_elements_in a right max)) ))))

(declare-fun all_right_elements_in ((Array Int integer) Int Int) Bool)

(declare-fun all_right_elements_in__function_guard (Bool (Array Int integer)
  Int Int) Bool)

;; all_right_elements_in__post_axiom
  (assert true)

;; all_right_elements_in__def_axiom
  (assert
  (forall ((a (Array Int integer)))
  (forall ((left Int) (max Int))
  (! (= (= (all_right_elements_in a left max) true)
     (forall ((k Int))
     (=> (and (<= 0 k) (<= k 7))
     (=> (< left k)
     (let ((temp___187 (to_rep (select a k))))
     (and (<= (- max) temp___187) (<= temp___187 max))))))) :pattern (
  (all_right_elements_in a left max)) ))))

(declare-fun intermediate_form ((Array Int integer)
  (Array Int integer)) Bool)

(declare-fun intermediate_form__function_guard (Bool (Array Int integer)
  (Array Int integer)) Bool)

;; intermediate_form__post_axiom
  (assert true)

;; intermediate_form__def_axiom
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (! (= (= (intermediate_form a b) true)
     (and
     (and
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select a 7)) (+ (+ (+ (+ (+ (+ (+ (to_rep (select b 0)) 
     (to_rep (select b 1))) (to_rep (select b 2))) (to_rep (select b 3))) 
     (to_rep (select b 4))) (to_rep (select b 5))) (to_rep (select b 6))) 
     (to_rep (select b 7))))
     (= (to_rep (select a 3)) (+ (+ (+ (to_rep (select b 3)) (to_rep
                                                             (select b 2))) 
     (to_rep (select b 1))) (to_rep (select b 0)))))
     (= (to_rep (select a 5)) (+ (to_rep (select b 5)) (to_rep (select b 4)))))
     (= (to_rep (select a 1)) (+ (to_rep (select b 1)) (to_rep (select b 0)))))
     (= (to_rep (select a 0)) (to_rep (select b 0))))
     (= (to_rep (select a 2)) (to_rep (select b 2))))
     (= (to_rep (select a 4)) (to_rep (select b 4))))
     (= (to_rep (select a 6)) (to_rep (select b 6))))) :pattern ((intermediate_form
                                                                 a b)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const saved_a (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 7))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant3 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 7)) (in_range4 temp___expr_163)))

(declare-const a (Array Int integer))

(declare-const output_space Int)

(declare-const left Int)

(declare-const right Int)

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 a))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 output_space false false true true))

;; Assume
  (assert (= (all_elements_in a 1000000) true))

(declare-const space Int)

;; H
  (assert (= space 1))

;; Assume
  (assert (dynamic_invariant1 space true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant left false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant right false false true true))

;; Assume
  (assert (= a saved_a))

;; Assume
  (assert true)

;; H
  (assert (< space 8))

(declare-const temp___loop_entry_224 (Array Int integer))

;; H
  (assert (= temp___loop_entry_224 a))

(declare-const temp___loop_entry_236 (Array Int integer))

;; H
  (assert (= temp___loop_entry_236 a))

(declare-const temp___loop_entry_243 (Array Int integer))

;; H
  (assert (= temp___loop_entry_243 a))

(declare-const temp___loop_entry_230 (Array Int integer))

;; H
  (assert (= temp___loop_entry_230 a))

(declare-const temp___loop_entry_242 (Array Int integer))

;; H
  (assert (= temp___loop_entry_242 a))

(declare-const temp___loop_entry_249 (Array Int integer))

;; H
  (assert (= temp___loop_entry_249 a))

(declare-const temp___loop_entry_229 (Array Int integer))

;; H
  (assert (= temp___loop_entry_229 a))

(declare-const temp___loop_entry_235 (Array Int integer))

;; H
  (assert (= temp___loop_entry_235 a))

(declare-const temp___loop_entry_241 (Array Int integer))

;; H
  (assert (= temp___loop_entry_241 a))

(declare-const temp___loop_entry_248 (Array Int integer))

;; H
  (assert (= temp___loop_entry_248 a))

(declare-const temp___loop_entry_228 (Array Int integer))

;; H
  (assert (= temp___loop_entry_228 a))

(declare-const temp___loop_entry_234 (Array Int integer))

;; H
  (assert (= temp___loop_entry_234 a))

(declare-const temp___loop_entry_240 (Array Int integer))

;; H
  (assert (= temp___loop_entry_240 a))

(declare-const temp___loop_entry_247 (Array Int integer))

;; H
  (assert (= temp___loop_entry_247 a))

(declare-const temp___loop_entry_227 (Array Int integer))

;; H
  (assert (= temp___loop_entry_227 a))

(declare-const temp___loop_entry_239 (Array Int integer))

;; H
  (assert (= temp___loop_entry_239 a))

(declare-const temp___loop_entry_252 (Array Int integer))

;; H
  (assert (= temp___loop_entry_252 a))

(declare-const temp___loop_entry_233 (Array Int integer))

;; H
  (assert (= temp___loop_entry_233 a))

(declare-const temp___loop_entry_246 (Array Int integer))

;; H
  (assert (= temp___loop_entry_246 a))

(declare-const temp___loop_entry_226 (Array Int integer))

;; H
  (assert (= temp___loop_entry_226 a))

(declare-const temp___loop_entry_238 (Array Int integer))

;; H
  (assert (= temp___loop_entry_238 a))

(declare-const temp___loop_entry_245 (Array Int integer))

;; H
  (assert (= temp___loop_entry_245 a))

(declare-const temp___loop_entry_232 (Array Int integer))

;; H
  (assert (= temp___loop_entry_232 a))

(declare-const temp___loop_entry_251 (Array Int integer))

;; H
  (assert (= temp___loop_entry_251 a))

(declare-const temp___loop_entry_225 (Array Int integer))

;; H
  (assert (= temp___loop_entry_225 a))

(declare-const temp___loop_entry_237 (Array Int integer))

;; H
  (assert (= temp___loop_entry_237 a))

(declare-const temp___loop_entry_231 (Array Int integer))

;; H
  (assert (= temp___loop_entry_231 a))

(declare-const temp___loop_entry_244 (Array Int integer))

;; H
  (assert (= temp___loop_entry_244 a))

(declare-const temp___loop_entry_250 (Array Int integer))

;; H
  (assert (= temp___loop_entry_250 a))

;; H
  (assert (in_range3 (* space 1000000)))

;; H
  (assert
  (let ((o (* space 1000000)))
  (= (= (all_elements_in a o) true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (let ((temp___176 (to_rep (select a k))))
  (and (<= (- o) temp___176) (<= temp___176 o))))))))

(declare-const o Bool)

;; H
  (assert
  (ite (= (all_elements_in a (* space 1000000)) true)
  (= o (or (or (ite (= space 1) true false) (ite (= space 2) true false)) 
  (ite (= space 4) true false))) (= o false)))

;; H
  (assert
  (or (not (= o true))
  (or (= space 1)
  (ite (= space 2)
  (exists ((o1 Bool))
  (and
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (exists ((o6 Bool))
  (and
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_226 0)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_225 1)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select a 1)) o9)
  (ite (= o9 (+ o8 o7))
  (exists ((o10 Int))
  (and (= (to_rep (select temp___loop_entry_228 2)) o10)
  (exists ((o11 Int))
  (and (= (to_rep (select temp___loop_entry_227 3)) o11)
  (exists ((o12 Int))
  (and (= (to_rep (select a 3)) o12)
  (= o6 (ite (= o12 (+ o11 o10)) true false)))))))) (= o6 false))))))))
  (ite (= o6 true)
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_230 4)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_229 5)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select a 5)) o9) (= o5 (ite (= o9 (+ o8 o7)) true false))))))))
  (= o5 false))))
  (ite (= o5 true)
  (exists ((o6 Int))
  (and (= (to_rep (select temp___loop_entry_232 6)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_231 7)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select a 7)) o8) (= o4 (ite (= o8 (+ o7 o6)) true false))))))))
  (= o4 false))))
  (ite (= o4 true)
  (exists ((o5 Int))
  (and (= (to_rep (select temp___loop_entry_233 0)) o5)
  (exists ((o6 Int))
  (and (= (to_rep (select a 0)) o6) (= o3 (ite (= o6 o5) true false))))))
  (= o3 false))))
  (ite (= o3 true)
  (exists ((o4 Int))
  (and (= (to_rep (select temp___loop_entry_234 2)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select a 2)) o5) (= o2 (ite (= o5 o4) true false))))))
  (= o2 false))))
  (ite (= o2 true)
  (exists ((o3 Int))
  (and (= (to_rep (select temp___loop_entry_235 4)) o3)
  (exists ((o4 Int))
  (and (= (to_rep (select a 4)) o4) (= o1 (ite (= o4 o3) true false))))))
  (= o1 false))))
  (or (not (= o1 true))
  (and (exists ((o2 Int)) (= (to_rep (select temp___loop_entry_236 6)) o2))
  (exists ((o2 Int)) (= (to_rep (select a 6)) o2))))))
  (or (not (= space 4))
  (exists ((o1 Bool))
  (and
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (exists ((o6 Bool))
  (and
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_240 0)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_239 1)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select temp___loop_entry_238 2)) o9)
  (exists ((o10 Int))
  (and (= (to_rep (select temp___loop_entry_237 3)) o10)
  (exists ((o11 Int))
  (and (= (to_rep (select a 3)) o11)
  (ite (= o11 (+ (+ (+ o10 o9) o8) o7))
  (exists ((o12 Int))
  (and (= (to_rep (select temp___loop_entry_244 4)) o12)
  (exists ((o13 Int))
  (and (= (to_rep (select temp___loop_entry_243 5)) o13)
  (exists ((o14 Int))
  (and (= (to_rep (select temp___loop_entry_242 6)) o14)
  (exists ((o15 Int))
  (and (= (to_rep (select temp___loop_entry_241 7)) o15)
  (exists ((o16 Int))
  (and (= (to_rep (select a 7)) o16)
  (= o6 (ite (= o16 (+ (+ (+ o15 o14) o13) o12)) true false))))))))))))
  (= o6 false))))))))))))
  (ite (= o6 true)
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_246 0)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_245 1)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select a 1)) o9) (= o5 (ite (= o9 (+ o8 o7)) true false))))))))
  (= o5 false))))
  (ite (= o5 true)
  (exists ((o6 Int))
  (and (= (to_rep (select temp___loop_entry_248 4)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_247 5)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select a 5)) o8) (= o4 (ite (= o8 (+ o7 o6)) true false))))))))
  (= o4 false))))
  (ite (= o4 true)
  (exists ((o5 Int))
  (and (= (to_rep (select temp___loop_entry_249 0)) o5)
  (exists ((o6 Int))
  (and (= (to_rep (select a 0)) o6) (= o3 (ite (= o6 o5) true false))))))
  (= o3 false))))
  (ite (= o3 true)
  (exists ((o4 Int))
  (and (= (to_rep (select temp___loop_entry_250 2)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select a 2)) o5) (= o2 (ite (= o5 o4) true false))))))
  (= o2 false))))
  (ite (= o2 true)
  (exists ((o3 Int))
  (and (= (to_rep (select temp___loop_entry_251 4)) o3)
  (exists ((o4 Int))
  (and (= (to_rep (select a 4)) o4) (= o1 (ite (= o4 o3) true false))))))
  (= o1 false))))
  (or (not (= o1 true))
  (and (exists ((o2 Int)) (= (to_rep (select temp___loop_entry_252 6)) o2))
  (exists ((o2 Int)) (= (to_rep (select a 6)) o2)))))))))))

(declare-const a2 (Array Int integer))

(declare-const space1 Int)

(declare-const left1 Int)

(declare-const right1 Int)

;; LoopInvariant
  (assert
  (and
  (and (= (all_elements_in a2 (* space1 1000000)) true)
  (or (or (= space1 1) (= space1 2)) (= space1 4)))
  (ite (= space1 1)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (= (to_rep (select a2 k)) (to_rep (select temp___loop_entry_224 k)))))
  (ite (= space1 2)
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (= (to_rep (select a2 1)) (+ (to_rep (select temp___loop_entry_225 1)) 
  (to_rep (select temp___loop_entry_226 0))))
  (= (to_rep (select a2 3)) (+ (to_rep (select temp___loop_entry_227 3)) 
  (to_rep (select temp___loop_entry_228 2)))))
  (= (to_rep (select a2 5)) (+ (to_rep (select temp___loop_entry_229 5)) 
  (to_rep (select temp___loop_entry_230 4)))))
  (= (to_rep (select a2 7)) (+ (to_rep (select temp___loop_entry_231 7)) 
  (to_rep (select temp___loop_entry_232 6)))))
  (= (to_rep (select a2 0)) (to_rep (select temp___loop_entry_233 0))))
  (= (to_rep (select a2 2)) (to_rep (select temp___loop_entry_234 2))))
  (= (to_rep (select a2 4)) (to_rep (select temp___loop_entry_235 4))))
  (= (to_rep (select a2 6)) (to_rep (select temp___loop_entry_236 6))))
  (=> (= space1 4)
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (= (to_rep (select a2 3)) (+ (+ (+ (to_rep
                                     (select temp___loop_entry_237 3)) 
  (to_rep (select temp___loop_entry_238 2))) (to_rep
                                             (select temp___loop_entry_239 1))) 
  (to_rep (select temp___loop_entry_240 0))))
  (= (to_rep (select a2 7)) (+ (+ (+ (to_rep
                                     (select temp___loop_entry_241 7)) 
  (to_rep (select temp___loop_entry_242 6))) (to_rep
                                             (select temp___loop_entry_243 5))) 
  (to_rep (select temp___loop_entry_244 4)))))
  (= (to_rep (select a2 1)) (+ (to_rep (select temp___loop_entry_245 1)) 
  (to_rep (select temp___loop_entry_246 0)))))
  (= (to_rep (select a2 5)) (+ (to_rep (select temp___loop_entry_247 5)) 
  (to_rep (select temp___loop_entry_248 4)))))
  (= (to_rep (select a2 0)) (to_rep (select temp___loop_entry_249 0))))
  (= (to_rep (select a2 2)) (to_rep (select temp___loop_entry_250 2))))
  (= (to_rep (select a2 4)) (to_rep (select temp___loop_entry_251 4))))
  (= (to_rep (select a2 6)) (to_rep (select temp___loop_entry_252 6)))))))))

;; H
  (assert
  (= (and (ite (and
               (and (dynamic_invariant1 space1 true true true true)
               (dynamic_invariant left1 false true true true))
               (dynamic_invariant right1 false true true true))
          true false) (ite (< space1 8) true false)) true))

(declare-const temp___253 Int)

;; H
  (assert (= temp___253 space1))

(declare-const left2 Int)

;; H
  (assert (= left2 (- space1 1)))

;; H
  (assert (< left2 8))

(declare-const temp___loop_entry_216 (Array Int integer))

;; H
  (assert (= temp___loop_entry_216 a2))

(declare-const temp___loop_entry_214 (Array Int integer))

;; H
  (assert (= temp___loop_entry_214 a2))

(declare-const temp___loop_entry_213 (Array Int integer))

;; H
  (assert (= temp___loop_entry_213 a2))

(declare-const o1 Bool)

;; H
  (assert
  (ite (= (mod2 (+ left2 1) space1) 0)
  (let ((o2 (* (* space1 2) 1000000)))
  (and (in_range3 o2)
  (and (= o1 (all_left_elements_in a2 left2 o2))
  (= (= o1 true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (=> (< k left2)
  (let ((temp___180 (to_rep (select a2 k))))
  (and (<= (- o2) temp___180) (<= temp___180 o2)))))))))) (= o1 false)))

(declare-const o2 Bool)

;; H
  (assert
  (ite (= o1 true)
  (let ((o3 (* space1 1000000)))
  (and (in_range3 o3)
  (let ((o4 (- left2 1)))
  (and (= o2 (all_right_elements_in a2 o4 o3))
  (= (= o2 true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (=> (< o4 k)
  (let ((temp___184 (to_rep (select a2 k))))
  (and (<= (- o3) temp___184) (<= temp___184 o3))))))))))) (= o2 false)))

(declare-const o3 Bool)

;; H
  (assert
  (ite (= o2 true)
  (= o3 (ite (= (mod2 (+ left2 1) (* space1 2)) space1) true false))
  (= o3 false)))

(declare-const o4 Bool)

;; H
  (assert
  (ite (= o3 true)
  (ite (<= 8 left2)
  (= o4 (or (ite (= left2 8) true false) (ite (= left2 9) true false)))
  (= o4 (distinct 1 0))) (= o4 false)))

(declare-const a3 (Array Int integer))

(declare-const left3 Int)

(declare-const right2 Int)

;; LoopInvariant
  (assert
  (and
  (and
  (and
  (and
  (and (= (mod2 (+ left3 1) space1) 0)
  (= (all_left_elements_in a3 left3 (* (* space1 2) 1000000)) true))
  (= (all_right_elements_in a3 (- left3 1) (* space1 1000000)) true))
  (= (mod2 (+ left3 1) (* space1 2)) space1))
  (=> (<= 8 left3) (or (= left3 8) (= left3 9))))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (ite (and (and (<= 0 k) (<= k (- left3 space1)))
       (= (mod2 (+ k 1) (* 2 space1)) 0))
  (= (to_rep (select a3 k)) (+ (to_rep (select temp___loop_entry_213 k)) 
  (to_rep (select temp___loop_entry_214 (- k space1)))))
  (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_216 k))))))))

;; H
  (assert
  (= (and (ite (and (dynamic_invariant left3 false true true true)
               (dynamic_invariant right2 false true true true))
          true false) (ite (< left3 8) true false)) true))

(declare-const temp___217 Int)

;; H
  (assert (= temp___217 left3))

(define-fun o5 () Int (+ left3 space1))

;; Ensures
  (assert (in_range1 o5))

(declare-const right3 Int)

;; H
  (assert (= right3 o5))

;; Assert
  (assert (and (<= 0 right3) (<= right3 7)))

(declare-const o6 Int)

;; Ensures
  (assert (= (to_rep (select a3 right3)) o6))

;; Assert
  (assert (and (<= 0 left3) (<= left3 7)))

(declare-const o7 Int)

;; Ensures
  (assert (= (to_rep (select a3 left3)) o7))

(define-fun o8 () Int (+ o7 o6))

;; Ensures
  (assert (in_range1 o8))

(declare-const o9 integer)

;; Ensures
  (assert (= (to_rep o9) o8))

;; Assert
  (assert (and (<= 0 right3) (<= right3 7)))

(declare-const a4 (Array Int integer))

;; H
  (assert (= a4 (store a3 right3 o9)))

(define-fun o10 () Int (* space1 2))

;; Ensures
  (assert (in_range1 o10))

(define-fun o11 () Int (+ left3 o10))

;; Ensures
  (assert (in_range1 o11))

;; Ensures
  (assert (in_range2 o11))

(declare-const left4 Int)

;; H
  (assert (= left4 o11))

;; H
  (assert (< left4 8))

(assert
;; defqtvc
 ;; File "prefixsum_expanded.ads", line 41, characters 0-0
  (not (< temp___217 left4)))
(check-sat)

(exit)
