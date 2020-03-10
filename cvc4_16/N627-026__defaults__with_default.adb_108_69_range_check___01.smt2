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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort scalar_with_default 0)

(declare-fun scalar_with_defaultqtint (scalar_with_default) Int)

;; scalar_with_default'axiom
  (assert
  (forall ((i scalar_with_default))
  (and (<= 0 (scalar_with_defaultqtint i))
  (<= (scalar_with_defaultqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (scalar_with_default scalar_with_default) Bool)

(declare-const dummy1 scalar_with_default)

(declare-datatypes ((scalar_with_default__ref 0))
(((scalar_with_default__refqtmk
  (scalar_with_default__content scalar_with_default)))))
(define-fun scalar_with_default__ref_scalar_with_default__content__7__projection ((a scalar_with_default__ref)) scalar_with_default 
  (scalar_with_default__content a))

(define-fun to_rep ((x scalar_with_default)) Int (scalar_with_defaultqtint x))

(declare-fun of_rep (Int) scalar_with_default)

;; inversion_axiom
  (assert
  (forall ((x scalar_with_default))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x scalar_with_default)) (! (in_range2
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort tscalar_with_defaultB 0)

(declare-fun tscalar_with_defaultBqtint (tscalar_with_defaultB) Int)

;; tscalar_with_defaultB'axiom
  (assert
  (forall ((i tscalar_with_defaultB))
  (and (<= (- 2147483648) (tscalar_with_defaultBqtint i))
  (<= (tscalar_with_defaultBqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tscalar_with_defaultB tscalar_with_defaultB) Bool)

(declare-const dummy2 tscalar_with_defaultB)

(declare-datatypes ((tscalar_with_defaultB__ref 0))
(((tscalar_with_defaultB__refqtmk
  (tscalar_with_defaultB__content tscalar_with_defaultB)))))
(define-fun tscalar_with_defaultB__ref_tscalar_with_defaultB__content__7__projection ((a tscalar_with_defaultB__ref)) tscalar_with_defaultB 
  (tscalar_with_defaultB__content a))

(define-fun to_rep1 ((x tscalar_with_defaultB)) Int (tscalar_with_defaultBqtint
                                                    x))

(declare-fun of_rep1 (Int) tscalar_with_defaultB)

;; inversion_axiom
  (assert
  (forall ((x tscalar_with_defaultB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tscalar_with_defaultB)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-const first Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tscalar_with_defaultB tscalar_with_defaultB) Bool)

(declare-const dummy3 tscalar_with_defaultB)

(declare-datatypes ((scalar_bad_default__ref 0))
(((scalar_bad_default__refqtmk
  (scalar_bad_default__content tscalar_with_defaultB)))))
(define-fun scalar_bad_default__ref_scalar_bad_default__content__6__projection ((a scalar_bad_default__ref)) tscalar_with_defaultB 
  (scalar_bad_default__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__with_default__bad_record3__rec_with_bad_discr__b Bool)))))
(define-fun us_split_discrs_rec__with_default__bad_record3__rec_with_bad_discr__b__projection ((a us_split_discrs)) Bool 
  (rec__with_default__bad_record3__rec_with_bad_discr__b a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__with_default__bad_record3__rec_with_bad_discr__f1 scalar_with_default)(rec__with_default__bad_record3__rec_with_bad_discr__f2 tscalar_with_defaultB)))))
(define-fun us_split_fields_rec__with_default__bad_record3__rec_with_bad_discr__f1__projection ((a us_split_fields)) scalar_with_default 
  (rec__with_default__bad_record3__rec_with_bad_discr__f1 a))

(define-fun us_split_fields_rec__with_default__bad_record3__rec_with_bad_discr__f2__projection ((a us_split_fields)) tscalar_with_defaultB 
  (rec__with_default__bad_record3__rec_with_bad_discr__f2 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun with_default__bad_record3__rec_with_bad_discr__f1__pred ((a us_rep)) Bool (= (ite 
  (rec__with_default__bad_record3__rec_with_bad_discr__b
  (us_split_discrs1 a)) 1 0) 1))

(define-fun with_default__bad_record3__rec_with_bad_discr__f2__pred ((a us_rep)) Bool (= (ite 
  (rec__with_default__bad_record3__rec_with_bad_discr__b
  (us_split_discrs1 a)) 1 0) 0))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__with_default__bad_record3__rec_with_bad_discr__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__with_default__bad_record3__rec_with_bad_discr__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (and
                        (=>
                        (with_default__bad_record3__rec_with_bad_discr__f1__pred
                        a)
                        (= (to_rep
                           (rec__with_default__bad_record3__rec_with_bad_discr__f1
                           (us_split_fields1 a))) (to_rep
                                                  (rec__with_default__bad_record3__rec_with_bad_discr__f1
                                                  (us_split_fields1 b)))))
                        (=>
                        (with_default__bad_record3__rec_with_bad_discr__f2__pred
                        a)
                        (= (to_rep1
                           (rec__with_default__bad_record3__rec_with_bad_discr__f2
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__with_default__bad_record3__rec_with_bad_discr__f2
                                                  (us_split_fields1 b)))))))
                   true false))

(define-fun in_range4 ((rec__with_default__bad_record3__rec_with_bad_discr__b1 Bool)
  (a us_split_discrs)) Bool (= rec__with_default__bad_record3__rec_with_bad_discr__b1 
  (rec__with_default__bad_record3__rec_with_bad_discr__b a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const with_default__bad_record3__rec_with_bad_discr__b__first__bit Int)

(declare-const with_default__bad_record3__rec_with_bad_discr__b__last__bit Int)

(declare-const with_default__bad_record3__rec_with_bad_discr__b__position Int)

;; with_default__bad_record3__rec_with_bad_discr__b__first__bit_axiom
  (assert
  (<= 0 with_default__bad_record3__rec_with_bad_discr__b__first__bit))

;; with_default__bad_record3__rec_with_bad_discr__b__last__bit_axiom
  (assert
  (< with_default__bad_record3__rec_with_bad_discr__b__first__bit with_default__bad_record3__rec_with_bad_discr__b__last__bit))

;; with_default__bad_record3__rec_with_bad_discr__b__position_axiom
  (assert (<= 0 with_default__bad_record3__rec_with_bad_discr__b__position))

(declare-const with_default__bad_record3__rec_with_bad_discr__f1__first__bit Int)

(declare-const with_default__bad_record3__rec_with_bad_discr__f1__last__bit Int)

(declare-const with_default__bad_record3__rec_with_bad_discr__f1__position Int)

;; with_default__bad_record3__rec_with_bad_discr__f1__first__bit_axiom
  (assert
  (<= 0 with_default__bad_record3__rec_with_bad_discr__f1__first__bit))

;; with_default__bad_record3__rec_with_bad_discr__f1__last__bit_axiom
  (assert
  (< with_default__bad_record3__rec_with_bad_discr__f1__first__bit with_default__bad_record3__rec_with_bad_discr__f1__last__bit))

;; with_default__bad_record3__rec_with_bad_discr__f1__position_axiom
  (assert (<= 0 with_default__bad_record3__rec_with_bad_discr__f1__position))

(declare-const with_default__bad_record3__rec_with_bad_discr__f2__first__bit Int)

(declare-const with_default__bad_record3__rec_with_bad_discr__f2__last__bit Int)

(declare-const with_default__bad_record3__rec_with_bad_discr__f2__position Int)

;; with_default__bad_record3__rec_with_bad_discr__f2__first__bit_axiom
  (assert
  (<= 0 with_default__bad_record3__rec_with_bad_discr__f2__first__bit))

;; with_default__bad_record3__rec_with_bad_discr__f2__last__bit_axiom
  (assert
  (< with_default__bad_record3__rec_with_bad_discr__f2__first__bit with_default__bad_record3__rec_with_bad_discr__f2__last__bit))

;; with_default__bad_record3__rec_with_bad_discr__f2__position_axiom
  (assert (<= 0 with_default__bad_record3__rec_with_bad_discr__f2__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((rec_with_bad_discr__ref 0))
(((rec_with_bad_discr__refqtmk (rec_with_bad_discr__content us_rep)))))
(define-fun rec_with_bad_discr__ref_rec_with_bad_discr__content__projection ((a rec_with_bad_discr__ref)) us_rep 
  (rec_with_bad_discr__content a))

(declare-const bad__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_436 us_rep)
  (temp___is_init_432 Bool) (temp___skip_constant_433 Bool)
  (temp___do_toplevel_434 Bool)
  (temp___do_typ_inv_435 Bool)) Bool (=>
                                     (with_default__bad_record3__rec_with_bad_discr__f2__pred
                                     temp___expr_436)
                                     (=>
                                     (or (= temp___is_init_432 true)
                                     (<= first 2147483647)) (dynamic_property
                                     first 2147483647
                                     (to_rep1
                                     (rec__with_default__bad_record3__rec_with_bad_discr__f2
                                     (us_split_fields1 temp___expr_436)))))))

(define-fun default_initial_assumption ((temp___expr_438 us_rep)
  (temp___skip_top_level_439 Bool)) Bool (and
                                         (= (rec__with_default__bad_record3__rec_with_bad_discr__b
                                            (us_split_discrs1
                                            temp___expr_438)) (distinct 0 0))
                                         (and
                                         (=>
                                         (with_default__bad_record3__rec_with_bad_discr__f1__pred
                                         temp___expr_438)
                                         (= (to_rep
                                            (rec__with_default__bad_record3__rec_with_bad_discr__f1
                                            (us_split_fields1
                                            temp___expr_438))) 0))
                                         (=>
                                         (with_default__bad_record3__rec_with_bad_discr__f2__pred
                                         temp___expr_438)
                                         (= (to_rep1
                                            (rec__with_default__bad_record3__rec_with_bad_discr__f2
                                            (us_split_fields1
                                            temp___expr_438))) 0)))))

(define-fun dynamic_invariant2 ((temp___expr_422 Int)
  (temp___is_init_418 Bool) (temp___skip_constant_419 Bool)
  (temp___do_toplevel_420 Bool)
  (temp___do_typ_inv_421 Bool)) Bool (=>
                                     (or (= temp___is_init_418 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_422)))

(define-fun dynamic_invariant3 ((temp___expr_429 Int)
  (temp___is_init_425 Bool) (temp___skip_constant_426 Bool)
  (temp___do_toplevel_427 Bool)
  (temp___do_typ_inv_428 Bool)) Bool (=>
                                     (or (= temp___is_init_425 true)
                                     (<= first 2147483647)) (dynamic_property
                                     first 2147483647 temp___expr_429)))

;; first__def_axiom
  (assert (= first c))

(assert
;; defqtvc
 ;; File "with_default.ads", line 20, characters 0-0
  (not
  (forall ((usf us_rep))
  (=> (dynamic_invariant c true false true true)
  (=>
  (= (distinct 0 0) (rec__with_default__bad_record3__rec_with_bad_discr__b
                    (us_split_discrs1 usf)))
  (=> (with_default__bad_record3__rec_with_bad_discr__f1__pred usf)
  (in_range2 0)))))))
(check-sat)
(exit)
