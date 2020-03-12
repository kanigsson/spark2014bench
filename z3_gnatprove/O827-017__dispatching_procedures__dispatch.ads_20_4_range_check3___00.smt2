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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

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

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__dispatch__mut_rec__d Bool)))))
(define-fun us_split_discrs_rec__dispatch__mut_rec__d__projection ((a us_split_discrs)) Bool 
  (rec__dispatch__mut_rec__d a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields (us_split_fieldsqtmk (rec__dispatch__mut_rec__i integer)))))
(define-fun us_split_fields_rec__dispatch__mut_rec__i__projection ((a us_split_fields)) integer 
  (rec__dispatch__mut_rec__i a))

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

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__dispatch__mut_rec__d
                                (us_split_discrs1 a)) 1 0) (ite (rec__dispatch__mut_rec__d
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__dispatch__mut_rec__i (us_split_fields1 a))) 
                        (to_rep
                        (rec__dispatch__mut_rec__i (us_split_fields1 b)))))
                   true false))

(define-fun in_range3 ((rec__dispatch__mut_rec__d1 Bool)
  (a us_split_discrs)) Bool (= rec__dispatch__mut_rec__d1 (rec__dispatch__mut_rec__d
                                                          a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const dispatch__mut_rec__d__first__bit Int)

(declare-const dispatch__mut_rec__d__last__bit Int)

(declare-const dispatch__mut_rec__d__position Int)

;; dispatch__mut_rec__d__first__bit_axiom
  (assert (<= 0 dispatch__mut_rec__d__first__bit))

;; dispatch__mut_rec__d__last__bit_axiom
  (assert
  (< dispatch__mut_rec__d__first__bit dispatch__mut_rec__d__last__bit))

;; dispatch__mut_rec__d__position_axiom
  (assert (<= 0 dispatch__mut_rec__d__position))

(declare-const dispatch__mut_rec__i__first__bit Int)

(declare-const dispatch__mut_rec__i__last__bit Int)

(declare-const dispatch__mut_rec__i__position Int)

;; dispatch__mut_rec__i__first__bit_axiom
  (assert (<= 0 dispatch__mut_rec__i__first__bit))

;; dispatch__mut_rec__i__last__bit_axiom
  (assert
  (< dispatch__mut_rec__i__first__bit dispatch__mut_rec__i__last__bit))

;; dispatch__mut_rec__i__position_axiom
  (assert (<= 0 dispatch__mut_rec__i__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((mut_rec__ref (mut_rec__refqtmk (mut_rec__content us_rep)))))
(define-fun mut_rec__ref_mut_rec__content__projection ((a mut_rec__ref)) us_rep 
  (mut_rec__content a))

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant1 result true false
     true true)))) :pattern ((id x)) )))

;; id__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true) (= (id x) x)) :pattern (
  (id x)) )))

(declare-const b_max Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (natural natural) Bool)

(declare-const dummy3 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
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
  (forall ((x natural)) (! (in_range4 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int natural))))))
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

(define-fun bool_eq1 ((a (Array Int natural)) (a__first Int) (a__last Int)
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
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const a1__first integer)

(declare-const a1__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const a2__first integer)

(declare-const a2__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const a3__first integer)

(declare-const a3__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r1__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(define-fun default_initial_assumption ((temp___expr_172 us_rep)
  (temp___skip_top_level_173 Bool)) Bool (= (rec__dispatch__mut_rec__d
                                            (us_split_discrs1
                                            temp___expr_172)) (distinct 1 0)))

(declare-const r2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r3__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((nat_array__ref (nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-datatypes () ((ta1S__ref (ta1S__refqtmk (ta1S__content us_t)))))
(define-fun ta1S__ref_ta1S__content__projection ((a ta1S__ref)) us_t 
  (ta1S__content a))

(declare-datatypes () ((ta2S__ref (ta2S__refqtmk (ta2S__content us_t)))))
(define-fun ta2S__ref_ta2S__content__projection ((a ta2S__ref)) us_t 
  (ta2S__content a))

(declare-datatypes () ((ta3S__ref (ta3S__refqtmk (ta3S__content us_t)))))
(define-fun ta3S__ref_ta3S__content__projection ((a ta3S__ref)) us_t 
  (ta3S__content a))

(define-fun dynamic_invariant2 ((temp___expr_188 us_t)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (not (= temp___skip_constant_185 true))
                                     (and (dynamic_property 1 b_max
                                     (first1 temp___expr_188)
                                     (last1 temp___expr_188))
                                     (and (= (first1 temp___expr_188) 1)
                                     (= (last1 temp___expr_188) b_max)))))

(define-fun default_initial_assumption1 ((temp___expr_190 us_t)
  (temp___skip_top_level_191 Bool)) Bool (and (= (first1 temp___expr_190) 1)
                                         (= (last1 temp___expr_190) b_max)))

(define-fun dynamic_invariant3 ((temp___expr_198 us_t)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (=>
                                     (not (= temp___skip_constant_195 true))
                                     (and (dynamic_property 1 b_max
                                     (first1 temp___expr_198)
                                     (last1 temp___expr_198))
                                     (and (= (first1 temp___expr_198) 1)
                                     (= (last1 temp___expr_198) b_max)))))

(define-fun default_initial_assumption2 ((temp___expr_200 us_t)
  (temp___skip_top_level_201 Bool)) Bool (and (= (first1 temp___expr_200) 1)
                                         (= (last1 temp___expr_200) b_max)))

(define-fun dynamic_invariant4 ((temp___expr_208 us_t)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (not (= temp___skip_constant_205 true))
                                     (and (dynamic_property 1 b_max
                                     (first1 temp___expr_208)
                                     (last1 temp___expr_208))
                                     (and (= (first1 temp___expr_208) 1)
                                     (= (last1 temp___expr_208) b_max)))))

(define-fun default_initial_assumption3 ((temp___expr_210 us_t)
  (temp___skip_top_level_211 Bool)) Bool (and (= (first1 temp___expr_210) 1)
                                         (= (last1 temp___expr_210) b_max)))

;; b_max__def_axiom
  (assert (and (id__function_guard (id 100) 100) (= b_max (id 100))))

(declare-const c1 Int)

(declare-const c2 Int)

(declare-const c3 Int)

(declare-const a1 (Array Int natural))

(declare-const a2 (Array Int natural))

(declare-const a3 (Array Int natural))

(declare-const r1__split_fields integer)

(declare-const r1__split_discrs Bool)

(define-fun dispatch__b_max__assume () Int (id 100))

;; H
  (assert (id__function_guard dispatch__b_max__assume 100))

;; H
  (assert (dynamic_invariant1 dispatch__b_max__assume true false true true))

;; H
  (assert (= dispatch__b_max__assume 100))

;; Assume
  (assert (= dispatch__b_max__assume b_max))

;; Assume
  (assert (dynamic_invariant1 b_max true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant c1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant c2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant c3 false false true true))

;; Assume
  (assert (default_initial_assumption1
  (of_array a1 (to_rep a1__first) (to_rep a1__last)) false))

;; Assume
  (assert
  (and (dynamic_property 1 b_max (to_rep a1__first) (to_rep a1__last))
  (and (= (to_rep a1__first) 1) (= (to_rep a1__last) b_max))))

;; H
  (assert (<= 1 b_max))

(assert
;; defqtvc
 ;; File "dispatch.ads", line 1, characters 0-0
  (not (<= 1 1)))
(check-sat)
