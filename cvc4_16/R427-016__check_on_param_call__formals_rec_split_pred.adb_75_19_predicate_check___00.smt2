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

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__formals_rec_split_pred__rec__d Bool)))))
(define-fun us_split_discrs_rec__formals_rec_split_pred__rec__d__projection ((a us_split_discrs)) Bool 
  (rec__formals_rec_split_pred__rec__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__formals_rec_split_pred__rec__f integer)(rec__formals_rec_split_pred__rec__g integer)(rec__formals_rec_split_pred__rec__h natural)))))
(define-fun us_split_fields_rec__formals_rec_split_pred__rec__f__projection ((a us_split_fields)) integer 
  (rec__formals_rec_split_pred__rec__f a))

(define-fun us_split_fields_rec__formals_rec_split_pred__rec__g__projection ((a us_split_fields)) integer 
  (rec__formals_rec_split_pred__rec__g a))

(define-fun us_split_fields_rec__formals_rec_split_pred__rec__h__projection ((a us_split_fields)) natural 
  (rec__formals_rec_split_pred__rec__h a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun formals_rec_split_pred__rec__f__pred ((a us_rep)) Bool (= (ite 
  (rec__formals_rec_split_pred__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun formals_rec_split_pred__rec__g__pred ((a us_rep)) Bool (= (ite 
  (rec__formals_rec_split_pred__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun formals_rec_split_pred__rec__h__pred ((a us_rep)) Bool (= (ite 
  (rec__formals_rec_split_pred__rec__d (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__formals_rec_split_pred__rec__d
                                (us_split_discrs1 a)) 1 0) (ite (rec__formals_rec_split_pred__rec__d
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (and
                        (and
                        (=> (formals_rec_split_pred__rec__f__pred a)
                        (= (to_rep
                           (rec__formals_rec_split_pred__rec__f
                           (us_split_fields1 a))) (to_rep
                                                  (rec__formals_rec_split_pred__rec__f
                                                  (us_split_fields1 b)))))
                        (=> (formals_rec_split_pred__rec__g__pred a)
                        (= (to_rep
                           (rec__formals_rec_split_pred__rec__g
                           (us_split_fields1 a))) (to_rep
                                                  (rec__formals_rec_split_pred__rec__g
                                                  (us_split_fields1 b))))))
                        (=> (formals_rec_split_pred__rec__h__pred a)
                        (= (to_rep1
                           (rec__formals_rec_split_pred__rec__h
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__formals_rec_split_pred__rec__h
                                                  (us_split_fields1 b)))))))
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

(declare-const formals_rec_split_pred__rec__d__first__bit Int)

(declare-const formals_rec_split_pred__rec__d__last__bit Int)

(declare-const formals_rec_split_pred__rec__d__position Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit formals_rec_split_pred__rec__d__last__bit))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position))

(declare-const formals_rec_split_pred__rec__f__first__bit Int)

(declare-const formals_rec_split_pred__rec__f__last__bit Int)

(declare-const formals_rec_split_pred__rec__f__position Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit formals_rec_split_pred__rec__f__last__bit))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position))

(declare-const formals_rec_split_pred__rec__g__first__bit Int)

(declare-const formals_rec_split_pred__rec__g__last__bit Int)

(declare-const formals_rec_split_pred__rec__g__position Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit formals_rec_split_pred__rec__g__last__bit))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position))

(declare-const formals_rec_split_pred__rec__h__first__bit Int)

(declare-const formals_rec_split_pred__rec__h__last__bit Int)

(declare-const formals_rec_split_pred__rec__h__position Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit formals_rec_split_pred__rec__h__last__bit))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((constr_rec__ref 0))
(((constr_rec__refqtmk (constr_rec__content us_rep)))))
(define-fun constr_rec__ref_constr_rec__content__projection ((a constr_rec__ref)) us_rep 
  (constr_rec__content a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const formals_rec_split_pred__rec__d__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__d__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__d__position1 Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit1))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit1 formals_rec_split_pred__rec__d__last__bit1))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position1))

(declare-const formals_rec_split_pred__rec__f__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__f__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__f__position1 Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit1))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit1 formals_rec_split_pred__rec__f__last__bit1))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position1))

(declare-const formals_rec_split_pred__rec__g__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__g__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__g__position1 Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit1))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit1 formals_rec_split_pred__rec__g__last__bit1))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position1))

(declare-const formals_rec_split_pred__rec__h__first__bit1 Int)

(declare-const formals_rec_split_pred__rec__h__last__bit1 Int)

(declare-const formals_rec_split_pred__rec__h__position1 Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit1))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit1 formals_rec_split_pred__rec__h__last__bit1))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((constr_rec_2__ref 0))
(((constr_rec_2__refqtmk (constr_rec_2__content us_rep)))))
(define-fun constr_rec_2__ref_constr_rec_2__content__projection ((a constr_rec_2__ref)) us_rep 
  (constr_rec_2__content a))

(define-fun in_range3 ((rec__formals_rec_split_pred__rec__d1 Bool)
  (a us_split_discrs)) Bool (= rec__formals_rec_split_pred__rec__d1 (rec__formals_rec_split_pred__rec__d
                                                                    a)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const formals_rec_split_pred__rec__d__first__bit2 Int)

(declare-const formals_rec_split_pred__rec__d__last__bit2 Int)

(declare-const formals_rec_split_pred__rec__d__position2 Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit2))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit2 formals_rec_split_pred__rec__d__last__bit2))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position2))

(declare-const formals_rec_split_pred__rec__f__first__bit2 Int)

(declare-const formals_rec_split_pred__rec__f__last__bit2 Int)

(declare-const formals_rec_split_pred__rec__f__position2 Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit2))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit2 formals_rec_split_pred__rec__f__last__bit2))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position2))

(declare-const formals_rec_split_pred__rec__g__first__bit2 Int)

(declare-const formals_rec_split_pred__rec__g__last__bit2 Int)

(declare-const formals_rec_split_pred__rec__g__position2 Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit2))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit2 formals_rec_split_pred__rec__g__last__bit2))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position2))

(declare-const formals_rec_split_pred__rec__h__first__bit2 Int)

(declare-const formals_rec_split_pred__rec__h__last__bit2 Int)

(declare-const formals_rec_split_pred__rec__h__position2 Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit2))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit2 formals_rec_split_pred__rec__h__last__bit2))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((rec____ref 0))
(((rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(define-fun dynamic_invariant ((temp___expr_187 us_rep)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_184 true))
                                     (in_range3 (distinct 1 0)
                                     (us_split_discrs1 temp___expr_187)))
                                     (=> (= temp___do_toplevel_185 true)
                                     (not
                                     (= (to_rep1
                                        (rec__formals_rec_split_pred__rec__h
                                        (us_split_fields1 temp___expr_187))) 0)))))

(define-fun default_initial_assumption ((temp___expr_190 us_rep)
  (temp___skip_top_level_191 Bool)) Bool (and
                                         (= (rec__formals_rec_split_pred__rec__d
                                            (us_split_discrs1
                                            temp___expr_190)) (distinct 1 0))
                                         (and
                                         (and
                                         (=>
                                         (formals_rec_split_pred__rec__f__pred
                                         temp___expr_190)
                                         (= (to_rep
                                            (rec__formals_rec_split_pred__rec__f
                                            (us_split_fields1
                                            temp___expr_190))) 1))
                                         (=>
                                         (formals_rec_split_pred__rec__g__pred
                                         temp___expr_190)
                                         (= (to_rep
                                            (rec__formals_rec_split_pred__rec__g
                                            (us_split_fields1
                                            temp___expr_190))) 1)))
                                         (=>
                                         (formals_rec_split_pred__rec__h__pred
                                         temp___expr_190)
                                         (= (to_rep1
                                            (rec__formals_rec_split_pred__rec__h
                                            (us_split_fields1
                                            temp___expr_190))) 1)))))

(define-fun dynamic_predicate ((temp___193 us_rep)) Bool (not
                                                         (= (to_rep1
                                                            (rec__formals_rec_split_pred__rec__h
                                                            (us_split_fields1
                                                            temp___193))) 0)))

(define-fun dynamic_invariant1 ((temp___expr_199 us_rep)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_196 true))
                                     (in_range3 (distinct 1 0)
                                     (us_split_discrs1 temp___expr_199)))
                                     (=> (= temp___do_toplevel_197 true)
                                     (not
                                     (= (to_rep1
                                        (rec__formals_rec_split_pred__rec__h
                                        (us_split_fields1 temp___expr_199))) 0)))))

(define-fun default_initial_assumption1 ((temp___expr_202 us_rep)
  (temp___skip_top_level_203 Bool)) Bool (and
                                         (= (rec__formals_rec_split_pred__rec__d
                                            (us_split_discrs1
                                            temp___expr_202)) (distinct 1 0))
                                         (and
                                         (and
                                         (=>
                                         (formals_rec_split_pred__rec__f__pred
                                         temp___expr_202)
                                         (= (to_rep
                                            (rec__formals_rec_split_pred__rec__f
                                            (us_split_fields1
                                            temp___expr_202))) 1))
                                         (=>
                                         (formals_rec_split_pred__rec__g__pred
                                         temp___expr_202)
                                         (= (to_rep
                                            (rec__formals_rec_split_pred__rec__g
                                            (us_split_fields1
                                            temp___expr_202))) 1)))
                                         (=>
                                         (formals_rec_split_pred__rec__h__pred
                                         temp___expr_202)
                                         (= (to_rep1
                                            (rec__formals_rec_split_pred__rec__h
                                            (us_split_fields1
                                            temp___expr_202))) 1)))))

(define-fun dynamic_predicate1 ((temp___205 us_rep)) Bool (not
                                                          (= (to_rep1
                                                             (rec__formals_rec_split_pred__rec__h
                                                             (us_split_fields1
                                                             temp___205))) 0)))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const u__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const formals_rec_split_pred__rec__d__first__bit3 Int)

(declare-const formals_rec_split_pred__rec__d__last__bit3 Int)

(declare-const formals_rec_split_pred__rec__d__position3 Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit3))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit3 formals_rec_split_pred__rec__d__last__bit3))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position3))

(declare-const formals_rec_split_pred__rec__f__first__bit3 Int)

(declare-const formals_rec_split_pred__rec__f__last__bit3 Int)

(declare-const formals_rec_split_pred__rec__f__position3 Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit3))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit3 formals_rec_split_pred__rec__f__last__bit3))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position3))

(declare-const formals_rec_split_pred__rec__g__first__bit3 Int)

(declare-const formals_rec_split_pred__rec__g__last__bit3 Int)

(declare-const formals_rec_split_pred__rec__g__position3 Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit3))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit3 formals_rec_split_pred__rec__g__last__bit3))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position3))

(declare-const formals_rec_split_pred__rec__h__first__bit3 Int)

(declare-const formals_rec_split_pred__rec__h__last__bit3 Int)

(declare-const formals_rec_split_pred__rec__h__position3 Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit3))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit3 formals_rec_split_pred__rec__h__last__bit3))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position3))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_rep)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) us_rep (t8b__content
                                                                    a))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const formals_rec_split_pred__rec__d__first__bit4 Int)

(declare-const formals_rec_split_pred__rec__d__last__bit4 Int)

(declare-const formals_rec_split_pred__rec__d__position4 Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit4))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit4 formals_rec_split_pred__rec__d__last__bit4))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position4))

(declare-const formals_rec_split_pred__rec__f__first__bit4 Int)

(declare-const formals_rec_split_pred__rec__f__last__bit4 Int)

(declare-const formals_rec_split_pred__rec__f__position4 Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit4))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit4 formals_rec_split_pred__rec__f__last__bit4))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position4))

(declare-const formals_rec_split_pred__rec__g__first__bit4 Int)

(declare-const formals_rec_split_pred__rec__g__last__bit4 Int)

(declare-const formals_rec_split_pred__rec__g__position4 Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit4))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit4 formals_rec_split_pred__rec__g__last__bit4))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position4))

(declare-const formals_rec_split_pred__rec__h__first__bit4 Int)

(declare-const formals_rec_split_pred__rec__h__last__bit4 Int)

(declare-const formals_rec_split_pred__rec__h__position4 Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit4))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit4 formals_rec_split_pred__rec__h__last__bit4))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position4))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content us_rep)))))
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) us_rep (t9b__content
                                                                    a))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const formals_rec_split_pred__rec__d__first__bit5 Int)

(declare-const formals_rec_split_pred__rec__d__last__bit5 Int)

(declare-const formals_rec_split_pred__rec__d__position5 Int)

;; formals_rec_split_pred__rec__d__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__first__bit5))

;; formals_rec_split_pred__rec__d__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__d__first__bit5 formals_rec_split_pred__rec__d__last__bit5))

;; formals_rec_split_pred__rec__d__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__d__position5))

(declare-const formals_rec_split_pred__rec__f__first__bit5 Int)

(declare-const formals_rec_split_pred__rec__f__last__bit5 Int)

(declare-const formals_rec_split_pred__rec__f__position5 Int)

;; formals_rec_split_pred__rec__f__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__first__bit5))

;; formals_rec_split_pred__rec__f__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__f__first__bit5 formals_rec_split_pred__rec__f__last__bit5))

;; formals_rec_split_pred__rec__f__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__f__position5))

(declare-const formals_rec_split_pred__rec__g__first__bit5 Int)

(declare-const formals_rec_split_pred__rec__g__last__bit5 Int)

(declare-const formals_rec_split_pred__rec__g__position5 Int)

;; formals_rec_split_pred__rec__g__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__first__bit5))

;; formals_rec_split_pred__rec__g__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__g__first__bit5 formals_rec_split_pred__rec__g__last__bit5))

;; formals_rec_split_pred__rec__g__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__g__position5))

(declare-const formals_rec_split_pred__rec__h__first__bit5 Int)

(declare-const formals_rec_split_pred__rec__h__last__bit5 Int)

(declare-const formals_rec_split_pred__rec__h__position5 Int)

;; formals_rec_split_pred__rec__h__first__bit_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__first__bit5))

;; formals_rec_split_pred__rec__h__last__bit_axiom
  (assert
  (< formals_rec_split_pred__rec__h__first__bit5 formals_rec_split_pred__rec__h__last__bit5))

;; formals_rec_split_pred__rec__h__position_axiom
  (assert (<= 0 formals_rec_split_pred__rec__h__position5))

(declare-fun user_eq7 (us_rep us_rep) Bool)

(declare-const dummy7 us_rep)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content us_rep)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_rep 
  (t10b__content a))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

(assert
;; defqtvc
 ;; File "formals_rec_split_pred.adb", line 1, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields))
  (=> (= x__split_fields (us_split_fieldsqtmk rliteral rliteral rliteral1))
  (=> (= x__split_discrs (us_split_discrsqtmk (distinct 1 0)))
  (let ((temp___213 (us_repqtmk (us_split_discrsqtmk (distinct 1 0))
                    (us_split_fieldsqtmk rliteral rliteral rliteral1))))
  (=> (dynamic_predicate temp___213)
  (forall ((y__split_fields us_split_fields))
  (=> (= y__split_fields (us_split_fields1 temp___213))
  (=> (= y__split_discrs (us_split_discrs1 temp___213))
  (=> (dynamic_invariant (us_repqtmk y__split_discrs y__split_fields) true
  false true true)
  (let ((temp___215 (us_repqtmk (us_split_discrsqtmk (distinct 1 0))
                    (us_split_fieldsqtmk rliteral rliteral rliteral1))))
  (=> (dynamic_predicate temp___215)
  (forall ((u__split_fields us_split_fields))
  (=> (= u__split_fields (us_split_fields1 temp___215))
  (=> (= u__split_discrs (us_split_discrs1 temp___215))
  (=> (dynamic_invariant (us_repqtmk u__split_discrs u__split_fields) true
  false true true)
  (=> (dynamic_predicate (us_repqtmk x__split_discrs x__split_fields))
  (forall ((formals_rec_split_pred__p__a__fields us_split_fields))
  (=> (dynamic_invariant
  (us_repqtmk x__split_discrs formals_rec_split_pred__p__a__fields) true true
  true true)
  (forall ((x__split_fields1 us_split_fields))
  (=> (= x__split_fields1 formals_rec_split_pred__p__a__fields)
  (forall ((x__split_fields2 us_split_fields))
  (=> (dynamic_predicate (us_repqtmk x__split_discrs x__split_fields2))
  (forall ((formals_rec_split_pred__p__a__fields1 us_split_fields))
  (=> (dynamic_invariant
  (us_repqtmk x__split_discrs formals_rec_split_pred__p__a__fields1) true
  true true true)
  (forall ((x__split_fields3 us_split_fields))
  (=> (= x__split_fields3 formals_rec_split_pred__p__a__fields1)
  (forall ((x__split_fields4 us_split_fields)) (dynamic_predicate
  (us_repqtmk x__split_discrs x__split_fields4)))))))))))))))))))))))))))))))
(check-sat)
(exit)
