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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort int_bad 0)

(declare-fun int_badqtint (int_bad) Int)

;; int_bad'axiom
  (assert
  (forall ((i int_bad))
  (and (<= (- 2147483648) (int_badqtint i)) (<= (int_badqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (int_bad int_bad) Bool)

(declare-const dummy1 int_bad)

(declare-datatypes ((int_bad__ref 0))
(((int_bad__refqtmk (int_bad__content int_bad)))))
(define-fun int_bad__ref_int_bad__content__projection ((a int_bad__ref)) int_bad 
  (int_bad__content a))

(define-fun to_rep1 ((x int_bad)) Int (int_badqtint x))

(declare-fun of_rep1 (Int) int_bad)

;; inversion_axiom
  (assert
  (forall ((x int_bad))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x int_bad)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
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
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const dummy2 (Array Int integer))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq2 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__preds__rec_bad__i integer)(rec__preds__rec_bad__x int_bad)(rec__preds__rec_bad__a (Array Int integer))))))
(define-fun us_split_fields_rec__preds__rec_bad__i__projection ((a us_split_fields)) integer 
  (rec__preds__rec_bad__i a))

(define-fun us_split_fields_rec__preds__rec_bad__x__projection ((a us_split_fields)) int_bad 
  (rec__preds__rec_bad__x a))

(define-fun us_split_fields_rec__preds__rec_bad__a__projection ((a us_split_fields)) (Array Int integer) 
  (rec__preds__rec_bad__a a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__preds__rec_bad__i (us_split_fields1 a))) 
                        (to_rep
                        (rec__preds__rec_bad__i (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__preds__rec_bad__x (us_split_fields1 a))) 
                        (to_rep1
                        (rec__preds__rec_bad__x (us_split_fields1 b)))))
                        (= (bool_eq
                           (rec__preds__rec_bad__a (us_split_fields1 a)) 1 10
                           (rec__preds__rec_bad__a (us_split_fields1 b)) 1
                           10) true))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const preds__rec_bad__i__first__bit Int)

(declare-const preds__rec_bad__i__last__bit Int)

(declare-const preds__rec_bad__i__position Int)

;; preds__rec_bad__i__first__bit_axiom
  (assert (<= 0 preds__rec_bad__i__first__bit))

;; preds__rec_bad__i__last__bit_axiom
  (assert (< preds__rec_bad__i__first__bit preds__rec_bad__i__last__bit))

;; preds__rec_bad__i__position_axiom
  (assert (<= 0 preds__rec_bad__i__position))

(declare-const preds__rec_bad__x__first__bit Int)

(declare-const preds__rec_bad__x__last__bit Int)

(declare-const preds__rec_bad__x__position Int)

;; preds__rec_bad__x__first__bit_axiom
  (assert (<= 0 preds__rec_bad__x__first__bit))

;; preds__rec_bad__x__last__bit_axiom
  (assert (< preds__rec_bad__x__first__bit preds__rec_bad__x__last__bit))

;; preds__rec_bad__x__position_axiom
  (assert (<= 0 preds__rec_bad__x__position))

(declare-const preds__rec_bad__a__first__bit Int)

(declare-const preds__rec_bad__a__last__bit Int)

(declare-const preds__rec_bad__a__position Int)

;; preds__rec_bad__a__first__bit_axiom
  (assert (<= 0 preds__rec_bad__a__first__bit))

;; preds__rec_bad__a__last__bit_axiom
  (assert (< preds__rec_bad__a__first__bit preds__rec_bad__a__last__bit))

;; preds__rec_bad__a__position_axiom
  (assert (<= 0 preds__rec_bad__a__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((rec_bad__ref 0))
(((rec_bad__refqtmk (rec_bad__content us_rep)))))
(define-fun rec_bad__ref_rec_bad__content__projection ((a rec_bad__ref)) us_rep 
  (rec_bad__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tarr_badD1 0)

(declare-fun tarr_badD1qtint (tarr_badD1) Int)

;; tarr_badD1'axiom
  (assert
  (forall ((i tarr_badD1))
  (and (<= 1 (tarr_badD1qtint i)) (<= (tarr_badD1qtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (tarr_badD1 tarr_badD1) Bool)

(declare-const dummy4 tarr_badD1)

(declare-datatypes ((tarr_badD1__ref 0))
(((tarr_badD1__refqtmk (tarr_badD1__content tarr_badD1)))))
(define-fun tarr_badD1__ref_tarr_badD1__content__projection ((a tarr_badD1__ref)) tarr_badD1 
  (tarr_badD1__content a))

(define-fun dynamic_invariant ((temp___expr_303 us_rep)
  (temp___is_init_299 Bool) (temp___skip_constant_300 Bool)
  (temp___do_toplevel_301 Bool)
  (temp___do_typ_inv_302 Bool)) Bool (and
                                     (=> (= temp___do_toplevel_301 true)
                                     (and
                                     (and
                                     (not
                                     (= (to_rep
                                        (rec__preds__rec_bad__i
                                        (us_split_fields1 temp___expr_303))) 0))
                                     (not
                                     (= (to_rep1
                                        (rec__preds__rec_bad__x
                                        (us_split_fields1 temp___expr_303))) 0)))
                                     (forall ((k Int))
                                     (=> (and (<= 1 k) (<= k 10))
                                     (not
                                     (= (to_rep
                                        (let ((temp___305 (rec__preds__rec_bad__a
                                                          (us_split_fields1
                                                          temp___expr_303))))
                                        (select temp___305 k))) 0))))))
                                     (and
                                     (let ((temp___307 (to_rep1
                                                       (rec__preds__rec_bad__x
                                                       (us_split_fields1
                                                       temp___expr_303)))))
                                     (or
                                     (and (<= (- 2147483648) temp___307)
                                     (<= temp___307 (- 1)))
                                     (and (<= 1 temp___307)
                                     (<= temp___307 2147483647))))
                                     (forall ((k Int))
                                     (=> (and (<= 1 k) (<= k 10))
                                     (not
                                     (= (to_rep
                                        (select (rec__preds__rec_bad__a
                                                (us_split_fields1
                                                temp___expr_303)) k)) 0)))))))

(define-fun default_initial_assumption ((temp___expr_312 us_rep)
  (temp___skip_top_level_313 Bool)) Bool (and
                                         (and
                                         (= (to_rep
                                            (rec__preds__rec_bad__i
                                            (us_split_fields1
                                            temp___expr_312))) 0)
                                         (= (to_rep1
                                            (rec__preds__rec_bad__x
                                            (us_split_fields1
                                            temp___expr_312))) 0))
                                         (forall ((temp___316 Int))
                                         (=>
                                         (and (<= 1 temp___316)
                                         (<= temp___316 10))
                                         (= (to_rep
                                            (select (rec__preds__rec_bad__a
                                                    (us_split_fields1
                                                    temp___expr_312)) temp___316)) 0)))))

(define-fun dynamic_predicate ((temp___317 us_rep)) Bool (and
                                                         (and
                                                         (not
                                                         (= (to_rep
                                                            (rec__preds__rec_bad__i
                                                            (us_split_fields1
                                                            temp___317))) 0))
                                                         (not
                                                         (= (to_rep1
                                                            (rec__preds__rec_bad__x
                                                            (us_split_fields1
                                                            temp___317))) 0)))
                                                         (forall ((k Int))
                                                         (=>
                                                         (and (<= 1 k)
                                                         (<= k 10))
                                                         (not
                                                         (= (to_rep
                                                            (let ((temp___319 
                                                            (rec__preds__rec_bad__a
                                                            (us_split_fields1
                                                            temp___317))))
                                                            (select temp___319 k))) 0))))))

(declare-const i9s Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i25s (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const i37s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant1 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_178 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_182))
                                     (=> (= temp___do_toplevel_180 true)
                                     (or
                                     (and (<= (- 2147483648) temp___expr_182)
                                     (<= temp___expr_182 (- 1)))
                                     (and (<= 1 temp___expr_182)
                                     (<= temp___expr_182 2147483647))))))

(define-fun dynamic_predicate1 ((temp___186 Int)) Bool (or
                                                       (and
                                                       (<= (- 2147483648) temp___186)
                                                       (<= temp___186 (- 1)))
                                                       (and (<= 1 temp___186)
                                                       (<= temp___186 2147483647))))

(define-fun dynamic_invariant2 ((temp___expr_268 (Array Int integer))
  (temp___is_init_264 Bool) (temp___skip_constant_265 Bool)
  (temp___do_toplevel_266 Bool)
  (temp___do_typ_inv_267 Bool)) Bool (=> (= temp___do_toplevel_266 true)
                                     (forall ((k Int))
                                     (=> (and (<= 1 k) (<= k 10))
                                     (not
                                     (= (to_rep (select temp___expr_268 k)) 0))))))

(define-fun default_initial_assumption1 ((temp___expr_271 (Array Int integer))
  (temp___skip_top_level_272 Bool)) Bool (forall ((temp___273 Int))
                                         (=>
                                         (and (<= 1 temp___273)
                                         (<= temp___273 10))
                                         (= (to_rep
                                            (select temp___expr_271 temp___273)) 0))))

(define-fun dynamic_predicate2 ((temp___274 (Array Int integer))) Bool 
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k 10)) (not (= (to_rep (select temp___274 k)) 0)))))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "preds.ads", line 67, characters 0-0
  (not
  (forall ((x__split_fields us_split_fields))
  (=> (dynamic_invariant1 i9s true false true true)
  (=> (dynamic_invariant2 i25s true false true true)
  (=> (dynamic_invariant i37s true false true true)
  (=> (dynamic_invariant1 i9s true false true true)
  (=> (dynamic_invariant2 i25s true false true true)
  (=> (dynamic_invariant i37s true false true true)
  (=> (dynamic_invariant (us_repqtmk x__split_fields) false false true true)
  (forall ((usf us_split_fields))
  (let ((usf1 (us_repqtmk usf)))
  (=> (default_initial_assumption usf1 false) (dynamic_predicate usf1))))))))))))))
(check-sat)
(exit)
