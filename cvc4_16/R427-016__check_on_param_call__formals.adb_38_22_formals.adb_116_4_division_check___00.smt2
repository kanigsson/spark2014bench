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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
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
  (forall ((a (Array Int natural)) (b (Array Int natural)))
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

(define-fun dynamic_invariant ((temp___expr_201 (Array Int natural))
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool)
  (temp___do_typ_inv_200 Bool)) Bool (=> (= temp___do_toplevel_199 true)
                                     (=> (= temp___is_init_197 true)
                                     (not
                                     (= (to_rep (select temp___expr_201 3)) 0)))))

(define-fun dynamic_predicate ((temp___208 (Array Int natural))) Bool 
  (not (= (to_rep (select temp___208 3)) 0)))

(define-fun dynamic_invariant1 ((temp___expr_224 (Array Int natural))
  (temp___is_init_220 Bool) (temp___skip_constant_221 Bool)
  (temp___do_toplevel_222 Bool)
  (temp___do_typ_inv_223 Bool)) Bool (=> (= temp___do_toplevel_222 true)
                                     (=> (= temp___is_init_220 true)
                                     (not
                                     (= (to_rep (select temp___expr_224 3)) 0)))))

(define-fun dynamic_predicate1 ((temp___231 (Array Int natural))) Bool 
  (not (= (to_rep (select temp___231 3)) 0)))

(declare-sort constr_int 0)

(declare-fun constr_intqtint (constr_int) Int)

;; constr_int'axiom
  (assert
  (forall ((i constr_int))
  (and (<= (- 10) (constr_intqtint i)) (<= (constr_intqtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 10) x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (constr_int constr_int) Bool)

(declare-const dummy1 constr_int)

(declare-datatypes ((constr_int__ref 0))
(((constr_int__refqtmk (constr_int__content constr_int)))))
(define-fun constr_int__ref_constr_int__content__projection ((a constr_int__ref)) constr_int 
  (constr_int__content a))

(define-fun dynamic_invariant2 ((temp___expr_214 Int)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_210 true)
                                     (<= (- 10) 10)) (in_range1
                                     temp___expr_214))
                                     (=> (= temp___do_toplevel_212 true)
                                     (=> (= temp___is_init_210 true)
                                     (or
                                     (and (<= (- 10) temp___expr_214)
                                     (<= temp___expr_214 (- 1)))
                                     (and (<= 1 temp___expr_214)
                                     (<= temp___expr_214 10)))))))

(define-fun dynamic_predicate2 ((temp___218 Int)) Bool (or
                                                       (and
                                                       (<= (- 10) temp___218)
                                                       (<= temp___218 (- 1)))
                                                       (and (<= 1 temp___218)
                                                       (<= temp___218 10))))

(declare-sort constr_int_2 0)

(declare-fun constr_int_2qtint (constr_int_2) Int)

;; constr_int_2'axiom
  (assert
  (forall ((i constr_int_2))
  (and (<= (- 10) (constr_int_2qtint i)) (<= (constr_int_2qtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 10) x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (constr_int_2 constr_int_2) Bool)

(declare-const dummy2 constr_int_2)

(declare-datatypes ((constr_int_2__ref 0))
(((constr_int_2__refqtmk (constr_int_2__content constr_int_2)))))
(define-fun constr_int_2__ref_constr_int_2__content__projection ((a constr_int_2__ref)) constr_int_2 
  (constr_int_2__content a))

(define-fun dynamic_invariant3 ((temp___expr_237 Int)
  (temp___is_init_233 Bool) (temp___skip_constant_234 Bool)
  (temp___do_toplevel_235 Bool)
  (temp___do_typ_inv_236 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_233 true)
                                     (<= (- 10) 10)) (in_range2
                                     temp___expr_237))
                                     (=> (= temp___do_toplevel_235 true)
                                     (=> (= temp___is_init_233 true)
                                     (or
                                     (and (<= (- 10) temp___expr_237)
                                     (<= temp___expr_237 (- 1)))
                                     (and (<= 1 temp___expr_237)
                                     (<= temp___expr_237 10)))))))

(define-fun dynamic_predicate3 ((temp___241 Int)) Bool (or
                                                       (and
                                                       (<= (- 10) temp___241)
                                                       (<= temp___241 (- 1)))
                                                       (and (<= 1 temp___241)
                                                       (<= temp___241 10))))

(declare-sort my_int 0)

(declare-fun my_intqtint (my_int) Int)

;; my_int'axiom
  (assert
  (forall ((i my_int))
  (and (<= (- 10) (my_intqtint i)) (<= (my_intqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 10) x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (my_int my_int) Bool)

(declare-const dummy3 my_int)

(declare-datatypes ((my_int__ref 0))
(((my_int__refqtmk (my_int__content my_int)))))
(define-fun my_int__ref_my_int__content__projection ((a my_int__ref)) my_int 
  (my_int__content a))

(define-fun dynamic_invariant4 ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= (- 10) 10)) (in_range3
                                     temp___expr_194)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun to_rep1 ((x my_int)) Int (my_intqtint x))

(declare-fun of_rep1 (Int) my_int)

;; inversion_axiom
  (assert
  (forall ((x my_int))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x my_int)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun to_rep2 ((x constr_int)) Int (constr_intqtint x))

(declare-fun of_rep2 (Int) constr_int)

;; inversion_axiom
  (assert
  (forall ((x constr_int))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x constr_int)) (! (in_range1
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(define-fun to_rep3 ((x constr_int_2)) Int (constr_int_2qtint x))

(declare-fun of_rep3 (Int) constr_int_2)

;; inversion_axiom
  (assert
  (forall ((x constr_int_2))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x constr_int_2)) (! (in_range2
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(define-fun dynamic_predicate4 ((temp___243 (Array Int natural))) Bool 
  (not (= (to_rep (select temp___243 3)) 0)))

(define-fun dynamic_predicate5 ((temp___245 (Array Int natural))) Bool 
  (not (= (to_rep (select temp___245 3)) 0)))

(declare-fun formals__x__aggregate_def (Int) (Array Int natural))

(declare-fun formals__y__aggregate_def (Int) (Array Int natural))

(declare-fun formals__u__aggregate_def (Int) (Array Int natural))

(define-fun dynamic_invariant5 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___248 Int))
  (=> (dynamic_invariant5 temp___248 true true true true)
  (forall ((temp___249 Int))
  (= (select (formals__x__aggregate_def temp___248) temp___249) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___251 Int))
  (=> (dynamic_invariant5 temp___251 true true true true)
  (forall ((temp___252 Int))
  (= (select (formals__y__aggregate_def temp___251) temp___252) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___256 Int))
  (=> (dynamic_invariant5 temp___256 true true true true)
  (forall ((temp___257 Int))
  (= (select (formals__u__aggregate_def temp___256) temp___257) rliteral)))))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 0))

(assert
;; defqtvc
 ;; File "formals.adb", line 1, characters 0-0
  (not
  (forall ((x (Array Int natural)))
  (=> (= x (formals__x__aggregate_def 1))
  (let ((temp___253 (formals__y__aggregate_def 1)))
  (=> (dynamic_predicate4 temp___253)
  (=> (dynamic_predicate temp___253)
  (forall ((y (Array Int natural)))
  (=> (= y temp___253)
  (=> (dynamic_invariant y true false true true)
  (let ((temp___258 (formals__u__aggregate_def 1)))
  (=> (dynamic_predicate5 temp___258)
  (=> (dynamic_predicate1 temp___258)
  (forall ((u (Array Int natural)))
  (=> (= u temp___258)
  (=> (dynamic_invariant1 u true false true true)
  (forall ((z Int))
  (=> (= z 1)
  (=> (dynamic_invariant4 z true false true true)
  (=> (or (and (<= (- 10) 1) (<= 1 (- 1))) (and (<= 1 1) (<= 1 10)))
  (forall ((w Int))
  (=> (= w 1)
  (=> (dynamic_invariant2 w true false true true)
  (=> (or (and (<= (- 10) 1) (<= 1 (- 1))) (and (<= 1 1) (<= 1 10)))
  (forall ((v Int))
  (=> (= v 1)
  (=> (dynamic_invariant3 v true false true true)
  (=> (or (and (<= (- 10) z) (<= z (- 1))) (and (<= 1 z) (<= z 10)))
  (forall ((formals__p__3__a Int))
  (=> (dynamic_invariant2 formals__p__3__a true true true true)
  (forall ((z1 Int))
  (=> (= z1 formals__p__3__a)
  (forall ((z2 Int))
  (=> (dynamic_invariant4 z2 true true true true)
  (forall ((z3 Int))
  (=> (dynamic_invariant4 z3 true true true true)
  (=> (or (and (<= (- 10) z3) (<= z3 (- 1))) (and (<= 1 z3) (<= z3 10)))
  (forall ((formals__p__3__a1 Int))
  (=> (dynamic_invariant2 formals__p__3__a1 true true true true)
  (forall ((z4 Int))
  (=> (= z4 formals__p__3__a1)
  (forall ((z5 Int))
  (=> (dynamic_invariant4 z5 true true true true)
  (=> (or (and (<= (- 10) z5) (<= z5 (- 1))) (and (<= 1 z5) (<= z5 10)))
  (forall ((formals__p__3__a2 Int))
  (=> (dynamic_invariant2 formals__p__3__a2 true true true true)
  (forall ((o my_int))
  (=> (= (to_rep1 o) formals__p__3__a2)
  (forall ((o1 Int))
  (=> (= (to_rep1 o) o1)
  (forall ((z6 Int))
  (=> (= z6 o1)
  (forall ((w1 Int))
  (=> (dynamic_invariant2 w1 true true true true)
  (forall ((formals__p2__2__a Int))
  (=> (dynamic_invariant4 formals__p2__2__a true true true true)
  (forall ((temp___270 constr_int))
  (=> (= (to_rep2 temp___270) formals__p2__2__a)
  (=>
  (let ((temp___272 (to_rep2 temp___270)))
  (or (and (<= (- 10) temp___272) (<= temp___272 (- 1)))
  (and (<= 1 temp___272) (<= temp___272 10))))
  (forall ((o2 Int))
  (=> (= (to_rep2 temp___270) o2)
  (forall ((w2 Int))
  (=> (= w2 o2)
  (forall ((z7 Int))
  (=> (dynamic_invariant4 z7 true true true true)
  (=> (or (and (<= (- 10) z7) (<= z7 (- 1))) (and (<= 1 z7) (<= z7 10)))
  (forall ((formals__p__4__a Int))
  (=> (dynamic_invariant3 formals__p__4__a true true true true)
  (forall ((o3 my_int))
  (=> (= (to_rep1 o3) formals__p__4__a)
  (=> (exists ((o4 Int)) (= (to_rep1 o3) o4))
  (forall ((v1 Int))
  (=> (dynamic_invariant3 v1 true true true true)
  (forall ((formals__p2__2__a1 Int))
  (=> (dynamic_invariant4 formals__p2__2__a1 true true true true)
  (forall ((temp___277 constr_int_2))
  (=> (= (to_rep3 temp___277) formals__p2__2__a1)
  (=>
  (let ((temp___279 (to_rep3 temp___277)))
  (or (and (<= (- 10) temp___279) (<= temp___279 (- 1)))
  (and (<= 1 temp___279) (<= temp___279 10))))
  (=> (exists ((o4 Int)) (= (to_rep3 temp___277) o4))
  (forall ((w3 Int))
  (=> (dynamic_invariant2 w3 true true true true)
  (forall ((formals__p2__2__a2 Int))
  (=> (dynamic_invariant4 formals__p2__2__a2 true true true true)
  (=>
  (or (and (<= (- 10) formals__p2__2__a2) (<= formals__p2__2__a2 (- 1)))
  (and (<= 1 formals__p2__2__a2) (<= formals__p2__2__a2 10)))
  (=> (dynamic_predicate x)
  (forall ((formals__p__a (Array Int natural)))
  (=> (dynamic_invariant formals__p__a true true true true)
  (forall ((x1 (Array Int natural)))
  (=> (= x1 formals__p__a)
  (forall ((x2 (Array Int natural)))
  (=> (dynamic_predicate x2)
  (forall ((formals__p__a1 (Array Int natural)))
  (=> (dynamic_invariant formals__p__a1 true true true true)
  (forall ((x3 (Array Int natural)))
  (=> (= x3 formals__p__a1)
  (forall ((x4 (Array Int natural)))
  (=> (dynamic_predicate x4)
  (forall ((formals__p__a2 (Array Int natural)))
  (=> (dynamic_invariant formals__p__a2 true true true true)
  (forall ((x5 (Array Int natural)))
  (=> (= x5 formals__p__a2)
  (forall ((y1 (Array Int natural)))
  (=> (dynamic_invariant y1 true true true true)
  (forall ((formals__p2__a (Array Int natural)))
  (forall ((y2 (Array Int natural)))
  (=> (= y2 formals__p2__a)
  (=> (dynamic_predicate y2)
  (forall ((y3 (Array Int natural)))
  (=> (dynamic_invariant y3 true true true true)
  (forall ((formals__p2__a1 (Array Int natural)))
  (=> (dynamic_predicate formals__p2__a1)
  (forall ((y4 (Array Int natural)))
  (=> (= y4 formals__p2__a1)
  (forall ((y5 (Array Int natural)))
  (=> (dynamic_invariant y5 true true true true)
  (forall ((spark__branch Bool))
  (=>
  (exists ((o4 Int))
  (and (= (to_rep (select y5 1)) o4)
  (and (= spark__branch (ite (= o4 0) true false))
  (or (not (= spark__branch true)) (dynamic_predicate
  (store y5 3 rliteral1))))))
  (forall ((x6 (Array Int natural)))
  (=> (dynamic_predicate x6)
  (forall ((o4 Int))
  (=> (= (to_rep (select x6 3)) o4)
  (=> (dynamic_predicate x6)
  (forall ((o5 Int)) (=> (= (to_rep (select x6 2)) o5) (not (= o4 0))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
