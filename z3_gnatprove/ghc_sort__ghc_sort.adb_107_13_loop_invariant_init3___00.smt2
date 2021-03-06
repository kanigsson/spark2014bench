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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
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

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((int_array__ref (int_array__refqtmk (int_array__content us_t)))))
(define-fun int_array__ref_int_array__content__projection ((a int_array__ref)) us_t 
  (int_array__content a))

(declare-const s us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const r__first integer)

(declare-const r__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_171 us_t)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_168 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_171)
                                     (last1 temp___expr_171)))
                                     (=> (= temp___do_toplevel_169 true)
                                     (=> (= temp___is_init_167 true)
                                     (= (first1 temp___expr_171) 1)))))

(define-fun dynamic_predicate ((temp___174 us_t)) Bool (= (first1 temp___174) 1))

(declare-datatypes () ((trS__ref (trS__refqtmk (trS__content us_t)))))
(define-fun trS__ref_trS__content__2__projection ((a trS__ref)) us_t 
  (trS__content a))

(declare-datatypes () ((t55b__ref (t55b__refqtmk (t55b__content us_t)))))
(define-fun t55b__ref_t55b__content__projection ((a t55b__ref)) us_t 
  (t55b__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes () ((t56b__ref (t56b__refqtmk (t56b__content integer)))))
(define-fun t56b__ref_t56b__content__projection ((a t56b__ref)) integer 
  (t56b__content a))

(define-fun dynamic_invariant2 ((temp___expr_283 us_t)
  (temp___is_init_279 Bool) (temp___skip_constant_280 Bool)
  (temp___do_toplevel_281 Bool)
  (temp___do_typ_inv_282 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_280 true))
                                     (and (dynamic_property (first1 s)
                                     (last1 s) (first1 temp___expr_283)
                                     (last1 temp___expr_283))
                                     (and
                                     (= (first1 temp___expr_283) (first1 s))
                                     (= (last1 temp___expr_283) (last1 s)))))
                                     (=> (= temp___is_init_279 true)
                                     (= (first1 temp___expr_283) 1))))

(define-fun default_initial_assumption ((temp___expr_287 us_t)
  (temp___skip_top_level_288 Bool)) Bool (and
                                         (= (first1 temp___expr_287) 
                                         (first1 s))
                                         (= (last1 temp___expr_287) (last1 s))))

(define-fun dynamic_predicate1 ((temp___291 us_t)) Bool (= (first1
                                                           temp___291) 1))

(define-fun dynamic_predicate2 ((temp___293 us_t)) Bool (= (first1
                                                           temp___293) 1))

(declare-fun temp_____aggregate_def_563 (Int Int Int) us_t)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___565 Int) (temp___566 Int) (temp___567 Int))
  (let ((temp___564 (temp_____aggregate_def_563 temp___565 temp___566
                    temp___567)))
  (=> (dynamic_invariant3 temp___565 true true true true)
  (and
  (=> (dynamic_property 1 2147483647 temp___566 temp___567)
  (and (= (first1 temp___564) temp___566) (= (last1 temp___564) temp___567)))
  (forall ((temp___568 Int))
  (= (select (to_array temp___564) temp___568) rliteral)))))))

(declare-const r (Array Int integer))

;; Assume
  (assert (dynamic_invariant1 s true false true true))

;; Assume
  (assert (< (length s) 2147483647))

;; Assume
  (assert (default_initial_assumption
  (of_array r (to_rep r__first) (to_rep r__last)) false))

;; Assume
  (assert
  (and (dynamic_property (first1 s) (last1 s) (to_rep r__first)
  (to_rep r__last))
  (and (= (to_rep r__first) (first1 s)) (= (to_rep r__last) (last1 s)))))

(declare-const j Int)

;; H
  (assert (= j 0))

;; Assume
  (assert (dynamic_invariant j true false true true))

(define-fun temp___569 () us_t (temp_____aggregate_def_563 0 (first1 s)
                               (last1 s)))

;; Assume
  (assert (= (first1 temp___569) (first1 s)))

;; Assume
  (assert (= (last1 temp___569) (last1 s)))

;; Assert
  (assert (dynamic_predicate2 temp___569))

;; Assert
  (assert
  (ite (<= (first1 temp___569) (last1 temp___569))
  (and (<= (first1 s) (last1 s))
  (= (- (last1 temp___569) (first1 temp___569)) (- (last1 s) (first1 s))))
  (< (last1 s) (first1 s))))

(define-fun temp___572 () us_t (of_array
                               (slide (to_array temp___569)
                               (first1 temp___569) (first1 s)) (first1 s)
                               (last1 s)))

;; Assert
  (assert (dynamic_predicate1 temp___572))

;; Assert
  (assert
  (ite (<= (first1 temp___572) (last1 temp___572))
  (and (<= (to_rep r__first) (to_rep r__last))
  (= (- (last1 temp___572) (first1 temp___572)) (- (to_rep r__last) (to_rep
                                                                    r__first))))
  (< (to_rep r__last) (to_rep r__first))))

(declare-const r1 (Array Int integer))

;; H
  (assert (= r1 (to_array temp___572)))

(define-fun temp___574 () Int (first1 s))

(define-fun temp___575 () Int (last1 s))

(declare-const i Int)

;; H
  (assert (= i temp___575))

;; H
  (assert
  (= (and (ite (<= temp___574 i) true false) (ite (<= i temp___575) true
                                             false)) true))

(define-fun o () Int (length s))

;; Ensures
  (assert (in_range1 o))

(define-fun o1 () Int (- o i))

;; Ensures
  (assert (in_range1 o1))

;; LoopInvariant
  (assert (= j (- (length s) i)))

(declare-const k Int)

;; H
  (assert (<= (+ i 1) k))

;; H
  (assert (<= k (last1 s)))

(assert
;; defqtvc
 ;; File "ghc_sort.ads", line 46, characters 0-0
  (not
  (= (to_rep (select r1 k)) (to_rep
                            (select (to_array s) (+ (- (length s) k) 1))))))
(check-sat)

(exit)
