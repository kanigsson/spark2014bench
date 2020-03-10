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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-sort even 0)

(declare-fun evenqtint (even) Int)

;; even'axiom
  (assert
  (forall ((i even))
  (and (<= (- 2147483648) (evenqtint i)) (<= (evenqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (even even) Bool)

(declare-const dummy1 even)

(declare-datatypes ((even__ref 0))
(((even__refqtmk (even__content even)))))
(define-fun even__ref_even__content__projection ((a even__ref)) even 
  (even__content a))

(define-fun to_rep ((x even)) Int (evenqtint x))

(declare-fun of_rep (Int) even)

;; inversion_axiom
  (assert
  (forall ((x even)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x even)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__dynamic_preds__even_pair__a even)(rec__dynamic_preds__even_pair__b even)))))
(define-fun us_split_fields_rec__dynamic_preds__even_pair__a__projection ((a us_split_fields)) even 
  (rec__dynamic_preds__even_pair__a a))

(define-fun us_split_fields_rec__dynamic_preds__even_pair__b__projection ((a us_split_fields)) even 
  (rec__dynamic_preds__even_pair__b a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__dynamic_preds__even_pair__a
                           (us_split_fields1 a))) (to_rep
                                                  (rec__dynamic_preds__even_pair__a
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__dynamic_preds__even_pair__b
                           (us_split_fields1 a))) (to_rep
                                                  (rec__dynamic_preds__even_pair__b
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const dynamic_preds__even_pair__a__first__bit Int)

(declare-const dynamic_preds__even_pair__a__last__bit Int)

(declare-const dynamic_preds__even_pair__a__position Int)

;; dynamic_preds__even_pair__a__first__bit_axiom
  (assert (<= 0 dynamic_preds__even_pair__a__first__bit))

;; dynamic_preds__even_pair__a__last__bit_axiom
  (assert
  (< dynamic_preds__even_pair__a__first__bit dynamic_preds__even_pair__a__last__bit))

;; dynamic_preds__even_pair__a__position_axiom
  (assert (<= 0 dynamic_preds__even_pair__a__position))

(declare-const dynamic_preds__even_pair__b__first__bit Int)

(declare-const dynamic_preds__even_pair__b__last__bit Int)

(declare-const dynamic_preds__even_pair__b__position Int)

;; dynamic_preds__even_pair__b__first__bit_axiom
  (assert (<= 0 dynamic_preds__even_pair__b__first__bit))

;; dynamic_preds__even_pair__b__last__bit_axiom
  (assert
  (< dynamic_preds__even_pair__b__first__bit dynamic_preds__even_pair__b__last__bit))

;; dynamic_preds__even_pair__b__position_axiom
  (assert (<= 0 dynamic_preds__even_pair__b__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((even_pair__ref 0))
(((even_pair__refqtmk (even_pair__content us_rep)))))
(define-fun even_pair__ref_even_pair__content__projection ((a even_pair__ref)) us_rep 
  (even_pair__content a))

(declare-datatypes ((even_close_pair__ref 0))
(((even_close_pair__refqtmk (even_close_pair__content us_rep)))))
(define-fun even_close_pair__ref_even_close_pair__content__projection ((a even_close_pair__ref)) us_rep 
  (even_close_pair__content a))

(define-fun dynamic_invariant1 ((temp___expr_210 us_rep)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (and
                                     (=> (= temp___do_toplevel_208 true)
                                     (=> (= temp___is_init_206 true)
                                     (= (to_rep
                                        (rec__dynamic_preds__even_pair__b
                                        (us_split_fields1 temp___expr_210))) (+ 
                                     (to_rep
                                     (rec__dynamic_preds__even_pair__a
                                     (us_split_fields1 temp___expr_210))) 2))))
                                     (and
                                     (=> (= temp___is_init_206 true)
                                     (= (mod2
                                        (to_rep
                                        (rec__dynamic_preds__even_pair__a
                                        (us_split_fields1 temp___expr_210)))
                                        2) 0))
                                     (=> (= temp___is_init_206 true)
                                     (= (mod2
                                        (to_rep
                                        (rec__dynamic_preds__even_pair__b
                                        (us_split_fields1 temp___expr_210)))
                                        2) 0)))))

(define-fun dynamic_predicate ((temp___218 us_rep)) Bool (= (to_rep
                                                            (rec__dynamic_preds__even_pair__b
                                                            (us_split_fields1
                                                            temp___218))) (+ 
  (to_rep (rec__dynamic_preds__even_pair__a (us_split_fields1 temp___218))) 2)))

(declare-const above Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant2 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_164 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_168))
                                     (=> (= temp___do_toplevel_166 true)
                                     (=> (= temp___is_init_164 true)
                                     (= (mod2 temp___expr_168 2) 0)))))

(define-fun dynamic_predicate1 ((temp___172 Int)) Bool (= (mod2 temp___172 2) 0))

(assert
;; defqtvc
 ;; File "dynamic_preds.ads", line 41, characters 0-0
  (not
  (forall ((result____split_fields us_split_fields)
  (result____split_fields1 us_split_fields) (o Int))
  (=> (dynamic_invariant above true false true true)
  (=> (dynamic_invariant1 (us_repqtmk result____split_fields) false false
  true true)
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= (mod2 above 2) 0) true false))
  (ite (= spark__branch true)
  (let ((temp___318 above))
  (and (= (mod2 temp___318 2) 0)
  (exists ((o1 even))
  (and (= (to_rep o1) temp___318)
  (and (dynamic_predicate
  (us_repqtmk
  (us_split_fieldsqtmk o1
  (rec__dynamic_preds__even_pair__b result____split_fields))))
  (= result____split_fields1 (us_split_fieldsqtmk o1
                             (rec__dynamic_preds__even_pair__b
                             result____split_fields))))))))
  (let ((o1 (+ above 1)))
  (and (in_range o1)
  (and (= (mod2 o1 2) 0)
  (exists ((o2 even))
  (and (= (to_rep o2) o1)
  (and (dynamic_predicate
  (us_repqtmk
  (us_split_fieldsqtmk o2
  (rec__dynamic_preds__even_pair__b result____split_fields))))
  (= result____split_fields1 (us_split_fieldsqtmk o2
                             (rec__dynamic_preds__even_pair__b
                             result____split_fields))))))))))))
  (=>
  (= (to_rep (rec__dynamic_preds__even_pair__a result____split_fields1)) o)
  (in_range (+ o 2)))))))))
(check-sat)
(exit)
