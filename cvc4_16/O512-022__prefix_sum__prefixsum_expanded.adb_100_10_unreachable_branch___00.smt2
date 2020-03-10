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

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
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

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
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

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant3 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 7)) (in_range4 temp___expr_163)))

(assert
;; defqtvc
 ;; File "prefixsum_expanded.ads", line 41, characters 0-0
  (not
  (forall ((a (Array Int integer)) (output_space Int) (left Int) (right Int)
  (space Int) (a1 (Array Int integer)) (space1 Int) (o Bool))
  (=> (dynamic_invariant1 output_space false false true true)
  (=> (= (all_elements_in a 1000000) true)
  (=> (= space 1)
  (=> (dynamic_invariant1 space true false true true)
  (=> (dynamic_invariant left false false true true)
  (=> (dynamic_invariant right false false true true)
  (=> (= a saved_a)
  (=>
  (ite (< space 8)
  (exists ((temp___loop_entry_224 (Array Int integer)))
  (and (= temp___loop_entry_224 a)
  (exists ((temp___loop_entry_236 (Array Int integer)))
  (and (= temp___loop_entry_236 a)
  (exists ((temp___loop_entry_243 (Array Int integer)))
  (and (= temp___loop_entry_243 a)
  (exists ((temp___loop_entry_230 (Array Int integer)))
  (and (= temp___loop_entry_230 a)
  (exists ((temp___loop_entry_242 (Array Int integer)))
  (and (= temp___loop_entry_242 a)
  (exists ((temp___loop_entry_249 (Array Int integer)))
  (and (= temp___loop_entry_249 a)
  (exists ((temp___loop_entry_229 (Array Int integer)))
  (and (= temp___loop_entry_229 a)
  (exists ((temp___loop_entry_235 (Array Int integer)))
  (and (= temp___loop_entry_235 a)
  (exists ((temp___loop_entry_241 (Array Int integer)))
  (and (= temp___loop_entry_241 a)
  (exists ((temp___loop_entry_248 (Array Int integer)))
  (and (= temp___loop_entry_248 a)
  (exists ((temp___loop_entry_228 (Array Int integer)))
  (and (= temp___loop_entry_228 a)
  (exists ((temp___loop_entry_234 (Array Int integer)))
  (and (= temp___loop_entry_234 a)
  (exists ((temp___loop_entry_240 (Array Int integer)))
  (and (= temp___loop_entry_240 a)
  (exists ((temp___loop_entry_247 (Array Int integer)))
  (and (= temp___loop_entry_247 a)
  (exists ((temp___loop_entry_227 (Array Int integer)))
  (and (= temp___loop_entry_227 a)
  (exists ((temp___loop_entry_239 (Array Int integer)))
  (and (= temp___loop_entry_239 a)
  (exists ((temp___loop_entry_252 (Array Int integer)))
  (and (= temp___loop_entry_252 a)
  (exists ((temp___loop_entry_233 (Array Int integer)))
  (and (= temp___loop_entry_233 a)
  (exists ((temp___loop_entry_246 (Array Int integer)))
  (and (= temp___loop_entry_246 a)
  (exists ((temp___loop_entry_226 (Array Int integer)))
  (and (= temp___loop_entry_226 a)
  (exists ((temp___loop_entry_238 (Array Int integer)))
  (and (= temp___loop_entry_238 a)
  (exists ((temp___loop_entry_245 (Array Int integer)))
  (and (= temp___loop_entry_245 a)
  (exists ((temp___loop_entry_232 (Array Int integer)))
  (and (= temp___loop_entry_232 a)
  (exists ((temp___loop_entry_251 (Array Int integer)))
  (and (= temp___loop_entry_251 a)
  (exists ((temp___loop_entry_225 (Array Int integer)))
  (and (= temp___loop_entry_225 a)
  (exists ((temp___loop_entry_237 (Array Int integer)))
  (and (= temp___loop_entry_237 a)
  (exists ((temp___loop_entry_231 (Array Int integer)))
  (and (= temp___loop_entry_231 a)
  (exists ((temp___loop_entry_244 (Array Int integer)))
  (and (= temp___loop_entry_244 a)
  (exists ((temp___loop_entry_250 (Array Int integer)))
  (and (= temp___loop_entry_250 a)
  (and
  (exists ((o1 Bool))
  (and
  (let ((o2 (* space 1000000)))
  (and (in_range3 o2)
  (let ((o3 (all_elements_in a o2)))
  (and
  (= (= o3 true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (let ((temp___176 (to_rep (select a k))))
  (and (<= (- o2) temp___176) (<= temp___176 o2))))))
  (ite (= o3 true)
  (= o1 (or (or (ite (= space 1) true false) (ite (= space 2) true false)) 
  (ite (= space 4) true false))) (= o1 false))))))
  (or (not (= o1 true))
  (or (= space 1)
  (ite (= space 2)
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
  (exists ((o7 Bool))
  (and
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_226 0)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select temp___loop_entry_225 1)) o9)
  (exists ((o10 Int))
  (and (= (to_rep (select a 1)) o10)
  (ite (= o10 (+ o9 o8))
  (exists ((o11 Int))
  (and (= (to_rep (select temp___loop_entry_228 2)) o11)
  (exists ((o12 Int))
  (and (= (to_rep (select temp___loop_entry_227 3)) o12)
  (exists ((o13 Int))
  (and (= (to_rep (select a 3)) o13)
  (= o7 (ite (= o13 (+ o12 o11)) true false)))))))) (= o7 false))))))))
  (ite (= o7 true)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_230 4)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select temp___loop_entry_229 5)) o9)
  (exists ((o10 Int))
  (and (= (to_rep (select a 5)) o10)
  (= o6 (ite (= o10 (+ o9 o8)) true false)))))))) (= o6 false))))
  (ite (= o6 true)
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_232 6)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_231 7)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select a 7)) o9) (= o5 (ite (= o9 (+ o8 o7)) true false))))))))
  (= o5 false))))
  (ite (= o5 true)
  (exists ((o6 Int))
  (and (= (to_rep (select temp___loop_entry_233 0)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select a 0)) o7) (= o4 (ite (= o7 o6) true false))))))
  (= o4 false))))
  (ite (= o4 true)
  (exists ((o5 Int))
  (and (= (to_rep (select temp___loop_entry_234 2)) o5)
  (exists ((o6 Int))
  (and (= (to_rep (select a 2)) o6) (= o3 (ite (= o6 o5) true false))))))
  (= o3 false))))
  (ite (= o3 true)
  (exists ((o4 Int))
  (and (= (to_rep (select temp___loop_entry_235 4)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select a 4)) o5) (= o2 (ite (= o5 o4) true false))))))
  (= o2 false))))
  (or (not (= o2 true))
  (and (exists ((o3 Int)) (= (to_rep (select temp___loop_entry_236 6)) o3))
  (exists ((o3 Int)) (= (to_rep (select a 6)) o3))))))
  (or (not (= space 4))
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
  (exists ((o7 Bool))
  (and
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_240 0)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select temp___loop_entry_239 1)) o9)
  (exists ((o10 Int))
  (and (= (to_rep (select temp___loop_entry_238 2)) o10)
  (exists ((o11 Int))
  (and (= (to_rep (select temp___loop_entry_237 3)) o11)
  (exists ((o12 Int))
  (and (= (to_rep (select a 3)) o12)
  (ite (= o12 (+ (+ (+ o11 o10) o9) o8))
  (exists ((o13 Int))
  (and (= (to_rep (select temp___loop_entry_244 4)) o13)
  (exists ((o14 Int))
  (and (= (to_rep (select temp___loop_entry_243 5)) o14)
  (exists ((o15 Int))
  (and (= (to_rep (select temp___loop_entry_242 6)) o15)
  (exists ((o16 Int))
  (and (= (to_rep (select temp___loop_entry_241 7)) o16)
  (exists ((o17 Int))
  (and (= (to_rep (select a 7)) o17)
  (= o7 (ite (= o17 (+ (+ (+ o16 o15) o14) o13)) true false))))))))))))
  (= o7 false))))))))))))
  (ite (= o7 true)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_246 0)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select temp___loop_entry_245 1)) o9)
  (exists ((o10 Int))
  (and (= (to_rep (select a 1)) o10)
  (= o6 (ite (= o10 (+ o9 o8)) true false)))))))) (= o6 false))))
  (ite (= o6 true)
  (exists ((o7 Int))
  (and (= (to_rep (select temp___loop_entry_248 4)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select temp___loop_entry_247 5)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select a 5)) o9) (= o5 (ite (= o9 (+ o8 o7)) true false))))))))
  (= o5 false))))
  (ite (= o5 true)
  (exists ((o6 Int))
  (and (= (to_rep (select temp___loop_entry_249 0)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select a 0)) o7) (= o4 (ite (= o7 o6) true false))))))
  (= o4 false))))
  (ite (= o4 true)
  (exists ((o5 Int))
  (and (= (to_rep (select temp___loop_entry_250 2)) o5)
  (exists ((o6 Int))
  (and (= (to_rep (select a 2)) o6) (= o3 (ite (= o6 o5) true false))))))
  (= o3 false))))
  (ite (= o3 true)
  (exists ((o4 Int))
  (and (= (to_rep (select temp___loop_entry_251 4)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select a 4)) o5) (= o2 (ite (= o5 o4) true false))))))
  (= o2 false))))
  (or (not (= o2 true))
  (and (exists ((o3 Int)) (= (to_rep (select temp___loop_entry_252 6)) o3))
  (exists ((o3 Int)) (= (to_rep (select a 6)) o3))))))))))))
  (exists ((a2 (Array Int integer)) (space2 Int) (left1 Int) (right1 Int))
  (and
  (and
  (and (= (all_elements_in a2 (* space2 1000000)) true)
  (or (or (= space2 1) (= space2 2)) (= space2 4)))
  (ite (= space2 1)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (= (to_rep (select a2 k)) (to_rep (select temp___loop_entry_224 k)))))
  (ite (= space2 2)
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
  (=> (= space2 4)
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
  (= (to_rep (select a2 6)) (to_rep (select temp___loop_entry_252 6))))))))
  (and
  (= (and (ite (and
               (and (dynamic_invariant1 space2 true true true true)
               (dynamic_invariant left1 false true true true))
               (dynamic_invariant right1 false true true true))
          true false) (ite (< space2 8) true false)) true)
  (exists ((temp___253 Int))
  (and (= temp___253 space2)
  (exists ((left2 Int))
  (and (= left2 (- space2 1))
  (and
  (ite (< left2 8)
  (exists ((temp___loop_entry_216 (Array Int integer)))
  (and (= temp___loop_entry_216 a2)
  (exists ((temp___loop_entry_214 (Array Int integer)))
  (and (= temp___loop_entry_214 a2)
  (exists ((temp___loop_entry_213 (Array Int integer)))
  (and (= temp___loop_entry_213 a2)
  (and
  (exists ((o1 Bool))
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (exists ((o4 Bool))
  (and
  (ite (= (mod2 (+ left2 1) space2) 0)
  (let ((o5 (* (* space2 2) 1000000)))
  (and (in_range3 o5)
  (and (= o4 (all_left_elements_in a2 left2 o5))
  (= (= o4 true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (=> (< k left2)
  (let ((temp___180 (to_rep (select a2 k))))
  (and (<= (- o5) temp___180) (<= temp___180 o5)))))))))) (= o4 false))
  (ite (= o4 true)
  (let ((o5 (* space2 1000000)))
  (and (in_range3 o5)
  (let ((o6 (- left2 1)))
  (and (= o3 (all_right_elements_in a2 o6 o5))
  (= (= o3 true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (=> (< o6 k)
  (let ((temp___184 (to_rep (select a2 k))))
  (and (<= (- o5) temp___184) (<= temp___184 o5))))))))))) (= o3 false))))
  (ite (= o3 true)
  (= o2 (ite (= (mod2 (+ left2 1) (* space2 2)) space2) true false))
  (= o2 false))))
  (ite (= o2 true)
  (ite (<= 8 left2)
  (= o1 (or (ite (= left2 8) true false) (ite (= left2 9) true false)))
  (= o1 (distinct 1 0))) (= o1 false)))))
  (exists ((a3 (Array Int integer)) (left3 Int) (right2 Int))
  (and
  (and
  (and
  (and
  (and
  (and (= (mod2 (+ left3 1) space2) 0)
  (= (all_left_elements_in a3 left3 (* (* space2 2) 1000000)) true))
  (= (all_right_elements_in a3 (- left3 1) (* space2 1000000)) true))
  (= (mod2 (+ left3 1) (* space2 2)) space2))
  (=> (<= 8 left3) (or (= left3 8) (= left3 9))))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (ite (and (and (<= 0 k) (<= k (- left3 space2)))
       (= (mod2 (+ k 1) (* 2 space2)) 0))
  (= (to_rep (select a3 k)) (+ (to_rep (select temp___loop_entry_213 k)) 
  (to_rep (select temp___loop_entry_214 (- k space2)))))
  (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_216 k)))))))
  (and
  (= (and (ite (and (dynamic_invariant left3 false true true true)
               (dynamic_invariant right2 false true true true))
          true false) (ite (< left3 8) true false)) true)
  (exists ((temp___217 Int))
  (and (= temp___217 left3)
  (let ((o1 (+ left3 space2)))
  (and (in_range1 o1)
  (exists ((right3 Int))
  (and (= right3 o1)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((o2 Int))
  (and (= (to_rep (select a3 right3)) o2)
  (and (and (<= 0 left3) (<= left3 7))
  (exists ((o3 Int))
  (and (= (to_rep (select a3 left3)) o3)
  (let ((o4 (+ o3 o2)))
  (and (in_range1 o4)
  (exists ((o5 integer))
  (and (= (to_rep o5) o4)
  (and (and (<= 0 right3) (<= right3 7))
  (and (= a1 (store a3 right3 o5))
  (let ((o6 (* space2 2)))
  (and (in_range1 o6)
  (let ((o7 (+ left3 o6)))
  (and (in_range1 o7)
  (and (in_range2 o7)
  (exists ((left4 Int)) (and (= left4 o7) (not (< left4 8)))))))))))))))))))))))))))))))))))))
  (= a1 a2))
  (let ((o1 (* space2 2)))
  (and (in_range1 o1)
  (and (in_range3 o1) (and (= space1 o1) (not (< space1 8)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (and (= a1 a) (= space1 space)))
  (=>
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
  (exists ((o6 Int))
  (and (= (to_rep (select saved_a 7)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select saved_a 6)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select saved_a 5)) o8)
  (exists ((o9 Int))
  (and (= (to_rep (select saved_a 4)) o9)
  (exists ((o10 Int))
  (and (= (to_rep (select saved_a 3)) o10)
  (exists ((o11 Int))
  (and (= (to_rep (select saved_a 2)) o11)
  (exists ((o12 Int))
  (and (= (to_rep (select saved_a 1)) o12)
  (exists ((o13 Int))
  (and (= (to_rep (select saved_a 0)) o13)
  (exists ((o14 Int))
  (and (= (to_rep (select a1 7)) o14)
  (ite (= o14 (+ (+ (+ (+ (+ (+ (+ o13 o12) o11) o10) o9) o8) o7) o6))
  (exists ((o15 Int))
  (and (= (to_rep (select saved_a 0)) o15)
  (exists ((o16 Int))
  (and (= (to_rep (select saved_a 1)) o16)
  (exists ((o17 Int))
  (and (= (to_rep (select saved_a 2)) o17)
  (exists ((o18 Int))
  (and (= (to_rep (select saved_a 3)) o18)
  (exists ((o19 Int))
  (and (= (to_rep (select a1 3)) o19)
  (= o5 (ite (= o19 (+ (+ (+ o18 o17) o16) o15)) true false))))))))))))
  (= o5 false))))))))))))))))))))
  (ite (= o5 true)
  (exists ((o6 Int))
  (and (= (to_rep (select saved_a 4)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select saved_a 5)) o7)
  (exists ((o8 Int))
  (and (= (to_rep (select a1 5)) o8)
  (= o4 (ite (= o8 (+ o7 o6)) true false)))))))) (= o4 false))))
  (ite (= o4 true)
  (exists ((o5 Int))
  (and (= (to_rep (select saved_a 0)) o5)
  (exists ((o6 Int))
  (and (= (to_rep (select saved_a 1)) o6)
  (exists ((o7 Int))
  (and (= (to_rep (select a1 1)) o7)
  (= o3 (ite (= o7 (+ o6 o5)) true false)))))))) (= o3 false))))
  (ite (= o3 true)
  (exists ((o4 Int))
  (and (= (to_rep (select saved_a 0)) o4)
  (exists ((o5 Int))
  (and (= (to_rep (select a1 0)) o5) (= o2 (ite (= o5 o4) true false))))))
  (= o2 false))))
  (ite (= o2 true)
  (exists ((o3 Int))
  (and (= (to_rep (select saved_a 2)) o3)
  (exists ((o4 Int))
  (and (= (to_rep (select a1 2)) o4) (= o1 (ite (= o4 o3) true false))))))
  (= o1 false))))
  (ite (= o1 true)
  (exists ((o2 Int))
  (and (= (to_rep (select saved_a 4)) o2)
  (exists ((o3 Int))
  (and (= (to_rep (select a1 4)) o3) (= o (ite (= o3 o2) true false))))))
  (= o false)))) (not (= o true))))))))))))))
(check-sat)
(exit)
