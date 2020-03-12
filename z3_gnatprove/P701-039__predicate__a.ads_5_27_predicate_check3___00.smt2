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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
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

(declare-sort pred 0)

(declare-fun predqtint (pred) Int)

;; pred'axiom
  (assert
  (forall ((i pred))
  (and (<= (- 2147483648) (predqtint i)) (<= (predqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (pred pred) Bool)

(declare-const dummy1 pred)

(declare-datatypes () ((pred__ref (pred__refqtmk (pred__content pred)))))
(define-fun pred__ref_pred__content__projection ((a pred__ref)) pred 
  (pred__content a))

(define-fun to_rep1 ((x pred)) Int (predqtint x))

(declare-fun of_rep1 (Int) pred)

;; inversion_axiom
  (assert
  (forall ((x pred)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x pred)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__a__rec__disc pred)))))
(define-fun us_split_discrs_rec__a__rec__disc__projection ((a us_split_discrs)) pred 
  (rec__a__rec__disc a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__a__rec__a integer)(rec__a__rec__b integer)))))
(define-fun us_split_fields_rec__a__rec__a__projection ((a us_split_fields)) integer 
  (rec__a__rec__a a))

(define-fun us_split_fields_rec__a__rec__b__projection ((a us_split_fields)) integer 
  (rec__a__rec__b a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun a__rec__a__pred ((a us_rep)) Bool (and
                                              (<= 1 (to_rep1
                                                    (rec__a__rec__disc
                                                    (us_split_discrs1 a))))
                                              (<= (to_rep1
                                                  (rec__a__rec__disc
                                                  (us_split_discrs1 a))) 4)))

(define-fun a__rec__b__pred ((a us_rep)) Bool (= (to_rep1
                                                 (rec__a__rec__disc
                                                 (us_split_discrs1 a))) 5))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1 (rec__a__rec__disc (us_split_discrs1 a))) 
                        (to_rep1 (rec__a__rec__disc (us_split_discrs1 b))))
                        (and
                        (=> (a__rec__a__pred a)
                        (= (to_rep (rec__a__rec__a (us_split_fields1 a))) 
                        (to_rep (rec__a__rec__a (us_split_fields1 b)))))
                        (=> (a__rec__b__pred a)
                        (= (to_rep (rec__a__rec__b (us_split_fields1 a))) 
                        (to_rep (rec__a__rec__b (us_split_fields1 b)))))))
                   true false))

(define-fun in_range2 ((rec__a__rec__disc1 Int)
  (a us_split_discrs)) Bool (= rec__a__rec__disc1 (to_rep1
                                                  (rec__a__rec__disc a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const a__rec__disc__first__bit Int)

(declare-const a__rec__disc__last__bit Int)

(declare-const a__rec__disc__position Int)

;; a__rec__disc__first__bit_axiom
  (assert (<= 0 a__rec__disc__first__bit))

;; a__rec__disc__last__bit_axiom
  (assert (< a__rec__disc__first__bit a__rec__disc__last__bit))

;; a__rec__disc__position_axiom
  (assert (<= 0 a__rec__disc__position))

(declare-const a__rec__a__first__bit Int)

(declare-const a__rec__a__last__bit Int)

(declare-const a__rec__a__position Int)

;; a__rec__a__first__bit_axiom
  (assert (<= 0 a__rec__a__first__bit))

;; a__rec__a__last__bit_axiom
  (assert (< a__rec__a__first__bit a__rec__a__last__bit))

;; a__rec__a__position_axiom
  (assert (<= 0 a__rec__a__position))

(declare-const a__rec__b__first__bit Int)

(declare-const a__rec__b__last__bit Int)

(declare-const a__rec__b__position Int)

;; a__rec__b__first__bit_axiom
  (assert (<= 0 a__rec__b__first__bit))

;; a__rec__b__last__bit_axiom
  (assert (< a__rec__b__first__bit a__rec__b__last__bit))

;; a__rec__b__position_axiom
  (assert (<= 0 a__rec__b__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((rec____ref (rec____refqtmk (rec____content us_rep)))))
(define-fun rec____ref_rec____content__projection ((a rec____ref)) us_rep 
  (rec____content a))

(declare-const a__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_169 us_rep)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (let ((temp___172 (to_rep1
                                                       (rec__a__rec__disc
                                                       (us_split_discrs1
                                                       temp___expr_169)))))
                                     (and (<= 1 temp___172)
                                     (<= temp___172 5))))

(define-fun default_initial_assumption ((temp___expr_174 us_rep)
  (temp___skip_top_level_175 Bool)) Bool (= (to_rep1
                                            (rec__a__rec__disc
                                            (us_split_discrs1
                                            temp___expr_174))) 10))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_155 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_159))
                                     (=> (= temp___do_toplevel_157 true)
                                     (=> (= temp___is_init_155 true)
                                     (and (<= 1 temp___expr_159)
                                     (<= temp___expr_159 5))))))

(define-fun dynamic_predicate ((temp___163 Int)) Bool (and (<= 1 temp___163)
                                                      (<= temp___163 5)))

(assert
;; defqtvc
 ;; File "a.ads", line 1, characters 0-0
  (not (<= 1 10)))
(check-sat)
