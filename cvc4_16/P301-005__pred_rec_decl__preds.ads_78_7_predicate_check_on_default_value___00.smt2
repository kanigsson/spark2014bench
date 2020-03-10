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

(declare-const i43s Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort rec_int_ok 0)

(declare-fun rec_int_okqtint (rec_int_ok) Int)

;; rec_int_ok'axiom
  (assert
  (forall ((i rec_int_ok))
  (and (<= (- 2147483648) (rec_int_okqtint i))
  (<= (rec_int_okqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (rec_int_ok rec_int_ok) Bool)

(declare-const dummy rec_int_ok)

(declare-datatypes ((rec_int_ok__ref 0))
(((rec_int_ok__refqtmk (rec_int_ok__content rec_int_ok)))))
(define-fun rec_int_ok__ref_rec_int_ok__content__projection ((a rec_int_ok__ref)) rec_int_ok 
  (rec_int_ok__content a))

(define-fun to_rep ((x rec_int_ok)) Int (rec_int_okqtint x))

(declare-fun of_rep (Int) rec_int_ok)

;; inversion_axiom
  (assert
  (forall ((x rec_int_ok))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x rec_int_ok)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__preds__rec_wrap_ok__x rec_int_ok)))))
(define-fun us_split_fields_rec__preds__rec_wrap_ok__x__projection ((a us_split_fields)) rec_int_ok 
  (rec__preds__rec_wrap_ok__x a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__preds__rec_wrap_ok__x (us_split_fields1 a))) 
                   (to_rep (rec__preds__rec_wrap_ok__x (us_split_fields1 b))))
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

(declare-const preds__rec_wrap_ok__x__first__bit Int)

(declare-const preds__rec_wrap_ok__x__last__bit Int)

(declare-const preds__rec_wrap_ok__x__position Int)

;; preds__rec_wrap_ok__x__first__bit_axiom
  (assert (<= 0 preds__rec_wrap_ok__x__first__bit))

;; preds__rec_wrap_ok__x__last__bit_axiom
  (assert
  (< preds__rec_wrap_ok__x__first__bit preds__rec_wrap_ok__x__last__bit))

;; preds__rec_wrap_ok__x__position_axiom
  (assert (<= 0 preds__rec_wrap_ok__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((rec_wrap_ok__ref 0))
(((rec_wrap_ok__refqtmk (rec_wrap_ok__content us_rep)))))
(define-fun rec_wrap_ok__ref_rec_wrap_ok__content__projection ((a rec_wrap_ok__ref)) us_rep 
  (rec_wrap_ok__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_346 us_rep)
  (temp___is_init_342 Bool) (temp___skip_constant_343 Bool)
  (temp___do_toplevel_344 Bool)
  (temp___do_typ_inv_345 Bool)) Bool (let ((temp___348 (to_rep
                                                       (rec__preds__rec_wrap_ok__x
                                                       (us_split_fields1
                                                       temp___expr_346)))))
                                     (or
                                     (and (<= (- 2147483648) temp___348)
                                     (<= temp___348 (- 1)))
                                     (and (<= 1 temp___348)
                                     (<= temp___348 2147483647)))))

(define-fun default_initial_assumption ((temp___expr_351 us_rep)
  (temp___skip_top_level_352 Bool)) Bool (= (to_rep
                                            (rec__preds__rec_wrap_ok__x
                                            (us_split_fields1
                                            temp___expr_351))) 1))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_326 Int)
  (temp___is_init_322 Bool) (temp___skip_constant_323 Bool)
  (temp___do_toplevel_324 Bool)
  (temp___do_typ_inv_325 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_322 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range temp___expr_326))
                                     (=> (= temp___do_toplevel_324 true)
                                     (or
                                     (and (<= (- 2147483648) temp___expr_326)
                                     (<= temp___expr_326 (- 1)))
                                     (and (<= 1 temp___expr_326)
                                     (<= temp___expr_326 2147483647))))))

(define-fun dynamic_predicate ((temp___330 Int)) Bool (or
                                                      (and
                                                      (<= (- 2147483648) temp___330)
                                                      (<= temp___330 (- 1)))
                                                      (and (<= 1 temp___330)
                                                      (<= temp___330 2147483647))))

(assert
;; defqtvc
 ;; File "preds.adb", line 63, characters 0-0
  (not
  (forall ((x__split_fields rec_int_ok) (usf rec_int_ok))
  (=> (dynamic_invariant1 i43s true false true true)
  (=> (dynamic_invariant1 i43s true false true true)
  (=> (dynamic_invariant (us_repqtmk (us_split_fieldsqtmk x__split_fields))
  false false true true)
  (=> (= (to_rep usf) 1)
  (let ((temp___445 (to_rep usf)))
  (or (and (<= (- 2147483648) temp___445) (<= temp___445 (- 1)))
  (and (<= 1 temp___445) (<= temp___445 2147483647)))))))))))
(check-sat)
(exit)
