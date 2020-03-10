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

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
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

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
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

(declare-const ghost__ (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const input_space Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

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

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "prefixsum_expanded.ads", line 47, characters 0-0
  (not
  (forall ((a (Array Int integer)) (left Int) (right Int) (temp Int))
  (=> (dynamic_invariant2 input_space true false true true)
  (=> (= (all_elements_in ghost__ 1000000) true)
  (=> (= (all_elements_in a 8000000) true)
  (=> (= input_space 8)
  (=> (= (intermediate_form a ghost__) true)
  (let ((o input_space))
  (=> (in_range2 o)
  (forall ((space Int))
  (=> (= space o)
  (=> (dynamic_invariant1 space true false true true)
  (=> (dynamic_invariant1 left false false true true)
  (=> (dynamic_invariant1 right false false true true)
  (=> (dynamic_invariant temp false false true true)
  (forall ((a1 (Array Int integer)))
  (=> (= a1 (store a 7 rliteral))
  (forall ((space1 Int))
  (=> (= space1 (div1 space 2))
  (forall ((saved_a (Array Int integer)))
  (=> (= saved_a a1)
  (=>
  (and
  (and
  (and
  (and
  (and
  (and
  (and (= (to_rep (select saved_a 0)) (to_rep (select ghost__ 0)))
  (= (to_rep (select saved_a 1)) (+ (to_rep (select ghost__ 0)) (to_rep
                                                                (select 
                                                                ghost__ 1)))))
  (= (to_rep (select saved_a 2)) (to_rep (select ghost__ 2))))
  (= (to_rep (select saved_a 3)) (+ (+ (+ (to_rep (select ghost__ 0)) 
  (to_rep (select ghost__ 1))) (to_rep (select ghost__ 2))) (to_rep
                                                            (select ghost__ 3)))))
  (= (to_rep (select saved_a 4)) (to_rep (select ghost__ 4))))
  (= (to_rep (select saved_a 5)) (+ (to_rep (select ghost__ 4)) (to_rep
                                                                (select 
                                                                ghost__ 5)))))
  (= (to_rep (select saved_a 6)) (to_rep (select ghost__ 6))))
  (= (to_rep (select saved_a 7)) 0))
  (forall ((a2 (Array Int integer)))
  (=>
  (ite (< 0 space1)
  (exists ((temp___loop_entry_281 (Array Int integer)))
  (and (= temp___loop_entry_281 a1)
  (exists ((temp___loop_entry_285 (Array Int integer)))
  (and (= temp___loop_entry_285 a1)
  (exists ((temp___loop_entry_284 (Array Int integer)))
  (and (= temp___loop_entry_284 a1)
  (exists ((temp___loop_entry_291 (Array Int integer)))
  (and (= temp___loop_entry_291 a1)
  (exists ((temp___loop_entry_280 (Array Int integer)))
  (and (= temp___loop_entry_280 a1)
  (exists ((temp___loop_entry_290 (Array Int integer)))
  (and (= temp___loop_entry_290 a1)
  (exists ((temp___loop_entry_279 (Array Int integer)))
  (and (= temp___loop_entry_279 a1)
  (exists ((temp___loop_entry_283 (Array Int integer)))
  (and (= temp___loop_entry_283 a1)
  (exists ((temp___loop_entry_289 (Array Int integer)))
  (and (= temp___loop_entry_289 a1)
  (exists ((temp___loop_entry_288 (Array Int integer)))
  (and (= temp___loop_entry_288 a1)
  (exists ((temp___loop_entry_278 (Array Int integer)))
  (and (= temp___loop_entry_278 a1)
  (exists ((temp___loop_entry_287 (Array Int integer)))
  (and (= temp___loop_entry_287 a1)
  (exists ((temp___loop_entry_282 (Array Int integer)))
  (and (= temp___loop_entry_282 a1)
  (exists ((temp___loop_entry_286 (Array Int integer)))
  (and (= temp___loop_entry_286 a1)
  (and
  (exists ((o1 Bool))
  (ite (= (or (or (ite (= space1 4) true false) (ite (= space1 2) true false)) 
  (ite (= space1 1) true false)) true)
  (let ((o2 (* (* (div1 4 space1) 8) 1000000)))
  (and (in_range3 o2)
  (and (= o1 (all_elements_in a1 o2))
  (= (= o1 true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (let ((temp___176 (to_rep (select a1 k))))
  (and (<= (- o2) temp___176) (<= temp___176 o2))))))))) (= o1 false)))
  (exists ((a3 (Array Int integer)) (space2 Int) (left1 Int) (right1 Int)
  (temp1 Int))
  (and
  (and
  (and (or (or (= space2 4) (= space2 2)) (= space2 1))
  (= (all_elements_in a3 (* (* (div1 4 space2) 8) 1000000)) true))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (ite (= space2 4)
  (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_278 k)))
  (ite (and (= space2 2) (or (= k 7) (= k 3)))
  (and
  (= (to_rep (select a3 7)) (+ (to_rep (select temp___loop_entry_279 7)) 
  (to_rep (select temp___loop_entry_280 3))))
  (= (to_rep (select a3 3)) (to_rep (select temp___loop_entry_281 7))))
  (ite (= space2 2)
  (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_282 k)))
  (ite (or (or (or (= k 1) (= k 3)) (= k 5)) (= k 7))
  (and
  (and
  (and (= (to_rep (select a3 1)) (to_rep (select temp___loop_entry_283 7)))
  (= (to_rep (select a3 3)) (+ (to_rep (select temp___loop_entry_284 1)) 
  (to_rep (select temp___loop_entry_285 7)))))
  (= (to_rep (select a3 5)) (+ (to_rep (select temp___loop_entry_286 7)) 
  (to_rep (select temp___loop_entry_287 3)))))
  (= (to_rep (select a3 7)) (+ (+ (to_rep (select temp___loop_entry_288 5)) 
  (to_rep (select temp___loop_entry_289 7))) (to_rep
                                             (select temp___loop_entry_290 3)))))
  (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_291 k))))))))))
  (and
  (= (and (ite (and
               (and
               (and (dynamic_invariant temp1 false true true true)
               (dynamic_invariant1 space2 true true true true))
               (dynamic_invariant1 left1 false true true true))
               (dynamic_invariant1 right1 false true true true))
          true false) (ite (< 0 space2) true false)) true)
  (exists ((temp___292 Int))
  (and (= temp___292 space2)
  (let ((o1 (* space2 2)))
  (and (in_range1 o1)
  (let ((o2 (- o1 1)))
  (and (in_range1 o2)
  (and (in_range2 o2)
  (exists ((right2 Int))
  (and (= right2 o2)
  (and
  (ite (< right2 8)
  (exists ((temp___loop_entry_269 (Array Int integer)))
  (and (= temp___loop_entry_269 a3)
  (exists ((temp___loop_entry_268 (Array Int integer)))
  (and (= temp___loop_entry_268 a3)
  (exists ((temp___loop_entry_266 (Array Int integer)))
  (and (= temp___loop_entry_266 a3)
  (exists ((temp___loop_entry_264 (Array Int integer)))
  (and (= temp___loop_entry_264 a3)
  (exists ((temp___loop_entry_263 (Array Int integer)))
  (and (= temp___loop_entry_263 a3)
  (and
  (exists ((o3 Bool))
  (ite (forall ((k Int))
       (=> (and (<= 0 k) (<= k 7))
       (ite (and (<= 0 k) (<= k (- right2 (* space2 2))))
       (ite (= (mod2 (+ k 1) (* 2 space2)) 0)
       (= (to_rep (select a3 k)) (+ (to_rep (select temp___loop_entry_263 k)) 
       (to_rep (select temp___loop_entry_264 (- k space2)))))
       (ite (= (mod2 (+ k 1) space2) 0)
       (= (to_rep (select a3 k)) (to_rep
                                 (select temp___loop_entry_266 (+ k space2))))
       (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_268 k)))))
       (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_269 k))))))
  (= o3 (ite (= (mod2 (+ right2 1) (* space2 2)) 0) true false))
  (= o3 false)))
  (exists ((a4 (Array Int integer)) (left2 Int) (right3 Int) (temp2 Int))
  (and
  (and
  (and
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (ite (and (<= 0 k) (<= k (- right3 (* space2 2))))
  (ite (= (mod2 (+ k 1) (* 2 space2)) 0)
  (= (to_rep (select a4 k)) (+ (to_rep (select temp___loop_entry_263 k)) 
  (to_rep (select temp___loop_entry_264 (- k space2)))))
  (ite (= (mod2 (+ k 1) space2) 0)
  (= (to_rep (select a4 k)) (to_rep
                            (select temp___loop_entry_266 (+ k space2))))
  (= (to_rep (select a4 k)) (to_rep (select temp___loop_entry_268 k)))))
  (= (to_rep (select a4 k)) (to_rep (select temp___loop_entry_269 k))))))
  (= (mod2 (+ right3 1) (* space2 2)) 0)) (not (<= 8 right3)))
  (and
  (= (and (ite (and
               (and (dynamic_invariant temp2 false true true true)
               (dynamic_invariant1 left2 false true true true))
               (dynamic_invariant1 right3 false true true true))
          true false) (ite (< right3 8) true false)) true)
  (exists ((temp___270 Int))
  (and (= temp___270 right3)
  (let ((o3 (- right3 space2)))
  (and (in_range1 o3)
  (and (in_range2 o3)
  (exists ((left3 Int))
  (and (= left3 o3)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((o4 Int))
  (and (= (to_rep (select a4 right3)) o4)
  (exists ((temp3 Int))
  (and (= temp3 o4)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((o5 Int))
  (and (= (to_rep (select a4 right3)) o5)
  (and (and (<= 0 left3) (<= left3 7))
  (exists ((o6 Int))
  (and (= (to_rep (select a4 left3)) o6)
  (let ((o7 (+ o6 o5)))
  (and (in_range1 o7)
  (exists ((o8 integer))
  (and (= (to_rep o8) o7)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((a5 (Array Int integer)))
  (and (= a5 (store a4 right3 o8))
  (exists ((o9 integer))
  (and (= (to_rep o9) temp3)
  (and (and (<= 0 left3) (<= left3 7))
  (and (= a2 (store a5 left3 o9))
  (let ((o10 (* space2 2)))
  (and (in_range1 o10)
  (let ((o11 (+ right3 o10)))
  (and (in_range1 o11)
  (and (in_range2 o11)
  (exists ((right4 Int)) (and (= right4 o11) (not (< right4 8))))))))))))))))))))))))))))))))))))))))))))))))))))
  (= a2 a3))
  (exists ((space3 Int)) (and (= space3 (div1 space2 2)) (not (< 0 space3))))))))))))))))))))))))))))))))))))))))))))))
  (= a2 a1))
  (=>
  (and
  (and
  (and
  (and
  (and
  (and
  (and (= (to_rep (select a2 0)) (to_rep (select saved_a 7)))
  (= (to_rep (select a2 1)) (+ (to_rep (select saved_a 0)) (to_rep
                                                           (select saved_a 7)))))
  (= (to_rep (select a2 2)) (+ (to_rep (select saved_a 1)) (to_rep
                                                           (select saved_a 7)))))
  (= (to_rep (select a2 3)) (+ (+ (to_rep (select saved_a 2)) (to_rep
                                                              (select saved_a 1))) 
  (to_rep (select saved_a 7)))))
  (= (to_rep (select a2 4)) (+ (to_rep (select saved_a 3)) (to_rep
                                                           (select saved_a 7)))))
  (= (to_rep (select a2 5)) (+ (+ (to_rep (select saved_a 4)) (to_rep
                                                              (select saved_a 3))) 
  (to_rep (select saved_a 7)))))
  (= (to_rep (select a2 6)) (+ (+ (to_rep (select saved_a 3)) (to_rep
                                                              (select saved_a 5))) 
  (to_rep (select saved_a 7)))))
  (= (to_rep (select a2 7)) (+ (+ (+ (to_rep (select saved_a 6)) (to_rep
                                                                 (select saved_a 3))) 
  (to_rep (select saved_a 5))) (to_rep (select saved_a 7)))))
  (forall ((o1 Int)) (=> (= (to_rep (select a2 0)) o1) (not (= o1 0))))))))))))))))))))))))))))))
(check-sat)
(exit)
