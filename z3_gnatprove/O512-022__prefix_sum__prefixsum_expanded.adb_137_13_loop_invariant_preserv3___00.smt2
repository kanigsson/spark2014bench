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

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
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

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
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

(declare-const a (Array Int integer))

(declare-const left Int)

(declare-const right Int)

(declare-const temp Int)

(declare-const saved_a (Array Int integer))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 input_space true false true true))

;; Assume
  (assert
  (and
  (and
  (and (= (all_elements_in ghost__ 1000000) true)
  (= (all_elements_in a 8000000) true)) (= input_space 8))
  (= (intermediate_form a ghost__) true)))

(define-fun o () Int input_space)

;; Ensures
  (assert (in_range2 o))

(declare-const space Int)

;; H
  (assert (= space o))

;; Assume
  (assert (dynamic_invariant1 space true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 left false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 right false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant temp false false true true))

;; Assume
  (assert true)

;; Assume
  (assert true)

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 (store a 7 rliteral)))

(declare-const space1 Int)

;; H
  (assert (= space1 (div1 space 2)))

(declare-const saved_a1 (Array Int integer))

;; H
  (assert (= saved_a1 a1))

;; Assert
  (assert
  (and
  (and
  (and
  (and
  (and
  (and
  (and (= (to_rep (select saved_a1 0)) (to_rep (select ghost__ 0)))
  (= (to_rep (select saved_a1 1)) (+ (to_rep (select ghost__ 0)) (to_rep
                                                                 (select 
                                                                 ghost__ 1)))))
  (= (to_rep (select saved_a1 2)) (to_rep (select ghost__ 2))))
  (= (to_rep (select saved_a1 3)) (+ (+ (+ (to_rep (select ghost__ 0)) 
  (to_rep (select ghost__ 1))) (to_rep (select ghost__ 2))) (to_rep
                                                            (select ghost__ 3)))))
  (= (to_rep (select saved_a1 4)) (to_rep (select ghost__ 4))))
  (= (to_rep (select saved_a1 5)) (+ (to_rep (select ghost__ 4)) (to_rep
                                                                 (select 
                                                                 ghost__ 5)))))
  (= (to_rep (select saved_a1 6)) (to_rep (select ghost__ 6))))
  (= (to_rep (select saved_a1 7)) 0)))

;; H
  (assert (< 0 space1))

(declare-const temp___loop_entry_281 (Array Int integer))

;; H
  (assert (= temp___loop_entry_281 a1))

(declare-const temp___loop_entry_285 (Array Int integer))

;; H
  (assert (= temp___loop_entry_285 a1))

(declare-const temp___loop_entry_284 (Array Int integer))

;; H
  (assert (= temp___loop_entry_284 a1))

(declare-const temp___loop_entry_291 (Array Int integer))

;; H
  (assert (= temp___loop_entry_291 a1))

(declare-const temp___loop_entry_280 (Array Int integer))

;; H
  (assert (= temp___loop_entry_280 a1))

(declare-const temp___loop_entry_290 (Array Int integer))

;; H
  (assert (= temp___loop_entry_290 a1))

(declare-const temp___loop_entry_279 (Array Int integer))

;; H
  (assert (= temp___loop_entry_279 a1))

(declare-const temp___loop_entry_283 (Array Int integer))

;; H
  (assert (= temp___loop_entry_283 a1))

(declare-const temp___loop_entry_289 (Array Int integer))

;; H
  (assert (= temp___loop_entry_289 a1))

(declare-const temp___loop_entry_288 (Array Int integer))

;; H
  (assert (= temp___loop_entry_288 a1))

(declare-const temp___loop_entry_278 (Array Int integer))

;; H
  (assert (= temp___loop_entry_278 a1))

(declare-const temp___loop_entry_287 (Array Int integer))

;; H
  (assert (= temp___loop_entry_287 a1))

(declare-const temp___loop_entry_282 (Array Int integer))

;; H
  (assert (= temp___loop_entry_282 a1))

(declare-const temp___loop_entry_286 (Array Int integer))

;; H
  (assert (= temp___loop_entry_286 a1))

(declare-const o1 Bool)

;; H
  (assert
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

(declare-const a2 (Array Int integer))

(declare-const space2 Int)

(declare-const left1 Int)

(declare-const right1 Int)

(declare-const temp1 Int)

;; LoopInvariant
  (assert
  (and
  (and (or (or (= space2 4) (= space2 2)) (= space2 1))
  (= (all_elements_in a2 (* (* (div1 4 space2) 8) 1000000)) true))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (ite (= space2 4)
  (= (to_rep (select a2 k)) (to_rep (select temp___loop_entry_278 k)))
  (ite (and (= space2 2) (or (= k 7) (= k 3)))
  (and
  (= (to_rep (select a2 7)) (+ (to_rep (select temp___loop_entry_279 7)) 
  (to_rep (select temp___loop_entry_280 3))))
  (= (to_rep (select a2 3)) (to_rep (select temp___loop_entry_281 7))))
  (ite (= space2 2)
  (= (to_rep (select a2 k)) (to_rep (select temp___loop_entry_282 k)))
  (ite (or (or (or (= k 1) (= k 3)) (= k 5)) (= k 7))
  (and
  (and
  (and (= (to_rep (select a2 1)) (to_rep (select temp___loop_entry_283 7)))
  (= (to_rep (select a2 3)) (+ (to_rep (select temp___loop_entry_284 1)) 
  (to_rep (select temp___loop_entry_285 7)))))
  (= (to_rep (select a2 5)) (+ (to_rep (select temp___loop_entry_286 7)) 
  (to_rep (select temp___loop_entry_287 3)))))
  (= (to_rep (select a2 7)) (+ (+ (to_rep (select temp___loop_entry_288 5)) 
  (to_rep (select temp___loop_entry_289 7))) (to_rep
                                             (select temp___loop_entry_290 3)))))
  (= (to_rep (select a2 k)) (to_rep (select temp___loop_entry_291 k)))))))))))

;; H
  (assert
  (= (and (ite (and
               (and
               (and (dynamic_invariant temp1 false true true true)
               (dynamic_invariant1 space2 true true true true))
               (dynamic_invariant1 left1 false true true true))
               (dynamic_invariant1 right1 false true true true))
          true false) (ite (< 0 space2) true false)) true))

(declare-const temp___292 Int)

;; H
  (assert (= temp___292 space2))

(define-fun o2 () Int (* space2 2))

;; Ensures
  (assert (in_range1 o2))

(define-fun o3 () Int (- o2 1))

;; Ensures
  (assert (in_range1 o3))

;; Ensures
  (assert (in_range2 o3))

(declare-const right2 Int)

;; H
  (assert (= right2 o3))

(declare-const a3 (Array Int integer))

;; H
  (assert
  (ite (< right2 8)
  (exists ((temp___loop_entry_269 (Array Int integer)))
  (and (= temp___loop_entry_269 a2)
  (exists ((temp___loop_entry_268 (Array Int integer)))
  (and (= temp___loop_entry_268 a2)
  (exists ((temp___loop_entry_266 (Array Int integer)))
  (and (= temp___loop_entry_266 a2)
  (exists ((temp___loop_entry_264 (Array Int integer)))
  (and (= temp___loop_entry_264 a2)
  (exists ((temp___loop_entry_263 (Array Int integer)))
  (and (= temp___loop_entry_263 a2)
  (and
  (exists ((o4 Bool))
  (ite (forall ((k Int))
       (=> (and (<= 0 k) (<= k 7))
       (ite (and (<= 0 k) (<= k (- right2 (* space2 2))))
       (ite (= (mod2 (+ k 1) (* 2 space2)) 0)
       (= (to_rep (select a2 k)) (+ (to_rep (select temp___loop_entry_263 k)) 
       (to_rep (select temp___loop_entry_264 (- k space2)))))
       (ite (= (mod2 (+ k 1) space2) 0)
       (= (to_rep (select a2 k)) (to_rep
                                 (select temp___loop_entry_266 (+ k space2))))
       (= (to_rep (select a2 k)) (to_rep (select temp___loop_entry_268 k)))))
       (= (to_rep (select a2 k)) (to_rep (select temp___loop_entry_269 k))))))
  (= o4 (ite (= (mod2 (+ right2 1) (* space2 2)) 0) true false))
  (= o4 false)))
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
  (let ((o4 (- right3 space2)))
  (and (in_range1 o4)
  (and (in_range2 o4)
  (exists ((left3 Int))
  (and (= left3 o4)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((o5 Int))
  (and (= (to_rep (select a4 right3)) o5)
  (exists ((temp3 Int))
  (and (= temp3 o5)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((o6 Int))
  (and (= (to_rep (select a4 right3)) o6)
  (and (and (<= 0 left3) (<= left3 7))
  (exists ((o7 Int))
  (and (= (to_rep (select a4 left3)) o7)
  (let ((o8 (+ o7 o6)))
  (and (in_range1 o8)
  (exists ((o9 integer))
  (and (= (to_rep o9) o8)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((a5 (Array Int integer)))
  (and (= a5 (store a4 right3 o9))
  (exists ((o10 integer))
  (and (= (to_rep o10) temp3)
  (and (and (<= 0 left3) (<= left3 7))
  (and (= a3 (store a5 left3 o10))
  (let ((o11 (* space2 2)))
  (and (in_range1 o11)
  (let ((o12 (+ right3 o11)))
  (and (in_range1 o12)
  (and (in_range2 o12)
  (exists ((right4 Int)) (and (= right4 o12) (not (< right4 8))))))))))))))))))))))))))))))))))))))))))))))))))))
  (= a3 a2)))

(declare-const space3 Int)

;; H
  (assert (= space3 (div1 space2 2)))

;; H
  (assert (< 0 space3))

(declare-const o4 Bool)

;; H
  (assert
  (ite (= (or (or (ite (= space3 4) true false) (ite (= space3 2) true false)) 
  (ite (= space3 1) true false)) true)
  (let ((o5 (* (* (div1 4 space3) 8) 1000000)))
  (and (in_range3 o5)
  (and (= o4 (all_elements_in a3 o5))
  (= (= o4 true)
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (let ((temp___176 (to_rep (select a3 k))))
  (and (<= (- o5) temp___176) (<= temp___176 o5))))))))) (= o4 false)))

(assert
;; defqtvc
 ;; File "prefixsum_expanded.ads", line 47, characters 0-0
  (not (or (or (= space3 4) (= space3 2)) (= space3 1))))
(check-sat)
