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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tscalar_with_defaultB 0)

(declare-fun tscalar_with_defaultBqtint (tscalar_with_defaultB) Int)

;; tscalar_with_defaultB'axiom
  (assert
  (forall ((i tscalar_with_defaultB))
  (and (<= (- 2147483648) (tscalar_with_defaultBqtint i))
  (<= (tscalar_with_defaultBqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tscalar_with_defaultB tscalar_with_defaultB) Bool)

(declare-const dummy1 tscalar_with_defaultB)

(declare-datatypes ((tscalar_with_defaultB__ref 0))
(((tscalar_with_defaultB__refqtmk
  (tscalar_with_defaultB__content tscalar_with_defaultB)))))
(define-fun tscalar_with_defaultB__ref_tscalar_with_defaultB__content__3__projection ((a tscalar_with_defaultB__ref)) tscalar_with_defaultB 
  (tscalar_with_defaultB__content a))

(define-fun to_rep ((x tscalar_with_defaultB)) Int (tscalar_with_defaultBqtint
                                                   x))

(declare-fun of_rep (Int) tscalar_with_defaultB)

;; inversion_axiom
  (assert
  (forall ((x tscalar_with_defaultB))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x tscalar_with_defaultB)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const first Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tscalar_with_defaultB tscalar_with_defaultB) Bool)

(declare-const dummy2 tscalar_with_defaultB)

(declare-datatypes ((scalar_bad_default__ref 0))
(((scalar_bad_default__refqtmk
  (scalar_bad_default__content tscalar_with_defaultB)))))
(define-fun scalar_bad_default__ref_scalar_bad_default__content__3__projection ((a scalar_bad_default__ref)) tscalar_with_defaultB 
  (scalar_bad_default__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int tscalar_with_defaultB))))))
(declare-fun slide ((Array Int tscalar_with_defaultB) Int
  Int) (Array Int tscalar_with_defaultB))

;; slide_eq
  (assert
  (forall ((a (Array Int tscalar_with_defaultB)))
  (forall ((first1 Int))
  (! (= (slide a first1 first1) a) :pattern ((slide a first1 first1)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int tscalar_with_defaultB)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int tscalar_with_defaultB)) (a__first Int)
  (a__last Int) (b (Array Int tscalar_with_defaultB)) (b__first Int)
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
  (forall ((a (Array Int tscalar_with_defaultB))
  (b (Array Int tscalar_with_defaultB)))
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

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort scalar_with_default 0)

(declare-fun scalar_with_defaultqtint (scalar_with_default) Int)

;; scalar_with_default'axiom
  (assert
  (forall ((i scalar_with_default))
  (and (<= 0 (scalar_with_defaultqtint i))
  (<= (scalar_with_defaultqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (scalar_with_default scalar_with_default) Bool)

(declare-const dummy3 scalar_with_default)

(declare-datatypes ((scalar_with_default__ref 0))
(((scalar_with_default__refqtmk
  (scalar_with_default__content scalar_with_default)))))
(define-fun scalar_with_default__ref_scalar_with_default__content__3__projection ((a scalar_with_default__ref)) scalar_with_default 
  (scalar_with_default__content a))

(declare-sort tTbadSP1 0)

(declare-fun tTbadSP1qtint (tTbadSP1) Int)

;; tTbadSP1'axiom
  (assert
  (forall ((i tTbadSP1))
  (and (<= 1 (tTbadSP1qtint i)) (<= (tTbadSP1qtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tTbadSP1 tTbadSP1) Bool)

(declare-const dummy4 tTbadSP1)

(declare-datatypes ((tTbadSP1__ref 0))
(((tTbadSP1__refqtmk (tTbadSP1__content tTbadSP1)))))
(define-fun tTbadSP1__ref_tTbadSP1__content__projection ((a tTbadSP1__ref)) tTbadSP1 
  (tTbadSP1__content a))

(define-fun dynamic_invariant1 ((temp___expr_223 (Array Int tscalar_with_defaultB))
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (forall ((temp___224 Int))
                                     (=>
                                     (and (<= 1 temp___224)
                                     (<= temp___224 100))
                                     (=>
                                     (or (= temp___is_init_219 true)
                                     (<= first 2147483647)) (dynamic_property
                                     first 2147483647
                                     (to_rep
                                     (select temp___expr_223 temp___224)))))))

(define-fun default_initial_assumption ((temp___expr_225 (Array Int tscalar_with_defaultB))
  (temp___skip_top_level_226 Bool)) Bool (forall ((temp___227 Int))
                                         (=>
                                         (and (<= 1 temp___227)
                                         (<= temp___227 100))
                                         (= (to_rep
                                            (select temp___expr_225 temp___227)) 0))))

(define-fun dynamic_invariant2 ((temp___expr_203 Int)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (or (= temp___is_init_199 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_203)))

(define-fun dynamic_invariant3 ((temp___expr_210 Int)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (<= first 2147483647)) (dynamic_property
                                     first 2147483647 temp___expr_210)))

;; first__def_axiom
  (assert (= first c))

(assert
;; defqtvc
 ;; File "with_default.ads", line 7, characters 0-0
  (not
  (=> (dynamic_invariant c true false true true)
  (=> (< 0 (length 1 100)) (dynamic_property first 2147483647 0)))))
(check-sat)
(exit)
