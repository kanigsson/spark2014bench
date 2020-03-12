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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__do_loops__r__f1 integer)(rec__do_loops__r__f2 integer)))))
(define-fun us_split_fields_rec__do_loops__r__f1__projection ((a us_split_fields)) integer 
  (rec__do_loops__r__f1 a))

(define-fun us_split_fields_rec__do_loops__r__f2__projection ((a us_split_fields)) integer 
  (rec__do_loops__r__f2 a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__do_loops__r__f1 (us_split_fields1 a))) 
                        (to_rep (rec__do_loops__r__f1 (us_split_fields1 b))))
                        (= (to_rep
                           (rec__do_loops__r__f2 (us_split_fields1 a))) 
                        (to_rep (rec__do_loops__r__f2 (us_split_fields1 b)))))
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

(declare-const do_loops__r__f1__first__bit Int)

(declare-const do_loops__r__f1__last__bit Int)

(declare-const do_loops__r__f1__position Int)

;; do_loops__r__f1__first__bit_axiom
  (assert (<= 0 do_loops__r__f1__first__bit))

;; do_loops__r__f1__last__bit_axiom
  (assert (< do_loops__r__f1__first__bit do_loops__r__f1__last__bit))

;; do_loops__r__f1__position_axiom
  (assert (<= 0 do_loops__r__f1__position))

(declare-const do_loops__r__f2__first__bit Int)

(declare-const do_loops__r__f2__last__bit Int)

(declare-const do_loops__r__f2__position Int)

;; do_loops__r__f2__first__bit_axiom
  (assert (<= 0 do_loops__r__f2__first__bit))

;; do_loops__r__f2__last__bit_axiom
  (assert (< do_loops__r__f2__first__bit do_loops__r__f2__last__bit))

;; do_loops__r__f2__position_axiom
  (assert (<= 0 do_loops__r__f2__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((r__ref (r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(define-fun default_initial_assumption ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__do_loops__r__f1
                                            (us_split_fields1
                                            temp___expr_181))) 0)
                                         (= (to_rep
                                            (rec__do_loops__r__f2
                                            (us_split_fields1
                                            temp___expr_181))) 0)))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const dummy2 (Array Int us_rep))

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

(declare-fun user_eq2 ((Array Int us_rep) (Array Int us_rep)) Bool)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__do_loops__r_array_record__f3 (Array Int us_rep))(rec__do_loops__r_array_record__f4 (Array Int us_rep))))))
(define-fun us_split_fields_rec__do_loops__r_array_record__f3__projection ((a us_split_fields2)) (Array Int us_rep) 
  (rec__do_loops__r_array_record__f3 a))

(define-fun us_split_fields_rec__do_loops__r_array_record__f4__projection ((a us_split_fields2)) (Array Int us_rep) 
  (rec__do_loops__r_array_record__f4 a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq1
                            (rec__do_loops__r_array_record__f3
                            (us_split_fields3 a)) 1 100
                            (rec__do_loops__r_array_record__f3
                            (us_split_fields3 b)) 1 100) true)
                         (= (bool_eq1
                            (rec__do_loops__r_array_record__f4
                            (us_split_fields3 a)) 1 100
                            (rec__do_loops__r_array_record__f4
                            (us_split_fields3 b)) 1 100) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const do_loops__r_array_record__f3__first__bit Int)

(declare-const do_loops__r_array_record__f3__last__bit Int)

(declare-const do_loops__r_array_record__f3__position Int)

;; do_loops__r_array_record__f3__first__bit_axiom
  (assert (<= 0 do_loops__r_array_record__f3__first__bit))

;; do_loops__r_array_record__f3__last__bit_axiom
  (assert
  (< do_loops__r_array_record__f3__first__bit do_loops__r_array_record__f3__last__bit))

;; do_loops__r_array_record__f3__position_axiom
  (assert (<= 0 do_loops__r_array_record__f3__position))

(declare-const do_loops__r_array_record__f4__first__bit Int)

(declare-const do_loops__r_array_record__f4__last__bit Int)

(declare-const do_loops__r_array_record__f4__position Int)

;; do_loops__r_array_record__f4__first__bit_axiom
  (assert (<= 0 do_loops__r_array_record__f4__first__bit))

;; do_loops__r_array_record__f4__last__bit_axiom
  (assert
  (< do_loops__r_array_record__f4__first__bit do_loops__r_array_record__f4__last__bit))

;; do_loops__r_array_record__f4__position_axiom
  (assert (<= 0 do_loops__r_array_record__f4__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ()
((r_array_record__ref
 (r_array_record__refqtmk (r_array_record__content us_rep1)))))
(define-fun r_array_record__ref_r_array_record__content__projection ((a r_array_record__ref)) us_rep1 
  (r_array_record__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tr_arrayD1 0)

(declare-fun tr_arrayD1qtint (tr_arrayD1) Int)

;; tr_arrayD1'axiom
  (assert
  (forall ((i tr_arrayD1))
  (and (<= 1 (tr_arrayD1qtint i)) (<= (tr_arrayD1qtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (tr_arrayD1 tr_arrayD1) Bool)

(declare-const dummy4 tr_arrayD1)

(declare-datatypes ()
((tr_arrayD1__ref (tr_arrayD1__refqtmk (tr_arrayD1__content tr_arrayD1)))))
(define-fun tr_arrayD1__ref_tr_arrayD1__content__projection ((a tr_arrayD1__ref)) tr_arrayD1 
  (tr_arrayD1__content a))

(define-fun default_initial_assumption1 ((temp___expr_206 us_rep1)
  (temp___skip_top_level_207 Bool)) Bool (and
                                         (forall ((temp___209 Int))
                                         (=>
                                         (and (<= 1 temp___209)
                                         (<= temp___209 100))
                                         (and
                                         (= (to_rep
                                            (rec__do_loops__r__f1
                                            (us_split_fields1
                                            (select (rec__do_loops__r_array_record__f3
                                                    (us_split_fields3
                                                    temp___expr_206)) temp___209)))) 0)
                                         (= (to_rep
                                            (rec__do_loops__r__f2
                                            (us_split_fields1
                                            (select (rec__do_loops__r_array_record__f3
                                                    (us_split_fields3
                                                    temp___expr_206)) temp___209)))) 0))))
                                         (forall ((temp___212 Int))
                                         (=>
                                         (and (<= 1 temp___212)
                                         (<= temp___212 100))
                                         (and
                                         (= (to_rep
                                            (rec__do_loops__r__f1
                                            (us_split_fields1
                                            (select (rec__do_loops__r_array_record__f4
                                                    (us_split_fields3
                                                    temp___expr_206)) temp___212)))) 0)
                                         (= (to_rep
                                            (rec__do_loops__r__f2
                                            (us_split_fields1
                                            (select (rec__do_loops__r_array_record__f4
                                                    (us_split_fields3
                                                    temp___expr_206)) temp___212)))) 0))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

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

(declare-fun user_eq5 (positive positive) Bool)

(declare-const dummy5 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size1 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment3))

(define-fun bool_eq3 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq6 (us_t us_t) Bool)

(declare-const dummy6 us_t)

(declare-datatypes ()
((u_array__ref (u_array__refqtmk (u_array__content us_t)))))
(define-fun u_array__ref_u_array__content__projection ((a u_array__ref)) us_t 
  (u_array__content a))

(declare-sort tTaSP1 0)

(declare-fun tTaSP1qtint (tTaSP1) Int)

;; tTaSP1'axiom
  (assert
  (forall ((i tTaSP1)) (and (<= 1 (tTaSP1qtint i)) (<= (tTaSP1qtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (tTaSP1 tTaSP1) Bool)

(declare-const dummy7 tTaSP1)

(declare-datatypes ()
((tTaSP1__ref (tTaSP1__refqtmk (tTaSP1__content tTaSP1)))))
(define-fun tTaSP1__ref_tTaSP1__content__projection ((a tTaSP1__ref)) tTaSP1 
  (tTaSP1__content a))

(define-fun default_initial_assumption2 ((temp___expr_231 (Array Int us_rep))
  (temp___skip_top_level_232 Bool)) Bool (forall ((temp___233 Int))
                                         (=>
                                         (and (<= 1 temp___233)
                                         (<= temp___233 100))
                                         (and
                                         (= (to_rep
                                            (rec__do_loops__r__f1
                                            (us_split_fields1
                                            (select temp___expr_231 temp___233)))) 0)
                                         (= (to_rep
                                            (rec__do_loops__r__f2
                                            (us_split_fields1
                                            (select temp___expr_231 temp___233)))) 0)))))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun default_initial_assumption3 ((temp___expr_189 (Array Int us_rep))
  (temp___skip_top_level_190 Bool)) Bool (forall ((temp___191 Int))
                                         (=>
                                         (and (<= 1 temp___191)
                                         (<= temp___191 100))
                                         (and
                                         (= (to_rep
                                            (rec__do_loops__r__f1
                                            (us_split_fields1
                                            (select temp___expr_189 temp___191)))) 0)
                                         (= (to_rep
                                            (rec__do_loops__r__f2
                                            (us_split_fields1
                                            (select temp___expr_189 temp___191)))) 0)))))

(define-fun dynamic_invariant2 ((temp___expr_197 us_t)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (not (= temp___skip_constant_194 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_197)
                                     (last1 temp___expr_197))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(declare-const spark__branch Bool)

(declare-const d__split_fields us_split_fields2)

(declare-const a (Array Int us_rep))

(declare-const d_outer__split_fields us_split_fields2)

(declare-const d_outer__split_fields1 us_split_fields)

;; Assume
  (assert (default_initial_assumption1 (us_repqtmk1 d__split_fields) false))

;; Assume
  (assert true)

;; Assume
  (assert (default_initial_assumption2 a false))

;; Assume
  (assert true)

(declare-const o integer)

;; Ensures
  (assert (= (to_rep o) 100))

(declare-const o1 integer)

;; Ensures
  (assert (= (to_rep o1) 1))

(declare-const do_loops__p__a (Array Int us_rep))

;; Ensures
  (assert true)

(declare-const i Int)

;; H
  (assert (= i 1))

;; H
  (assert
  (= (and (ite (<= 1 i) true false) (ite (<= i 100) true false)) true))

(define-fun usf () (Array Int us_rep) (rec__do_loops__r_array_record__f3
                                      d__split_fields))

(declare-const d__split_fields1 us_split_fields2)

(declare-const i1 Int)

;; H
  (assert
  (= (and (ite (and
               (forall ((temp___261 Int))
               (=> (and (<= 1 temp___261) (<= temp___261 100))
               (ite (or (< 100 temp___261)
                    (or (< temp___261 1) (<= i1 temp___261)))
               (= (select (rec__do_loops__r_array_record__f3
                          d__split_fields1) temp___261) (select (rec__do_loops__r_array_record__f3
                                                                d__split_fields) temp___261))
               (= (rec__do_loops__r__f2
                  (us_split_fields1
                  (select (rec__do_loops__r_array_record__f3
                          d__split_fields1) temp___261))) (rec__do_loops__r__f2
                                                          (us_split_fields1
                                                          (select (rec__do_loops__r_array_record__f3
                                                                  d__split_fields) temp___261)))))))
               (= (rec__do_loops__r_array_record__f4 d__split_fields1) 
               (rec__do_loops__r_array_record__f4 d__split_fields)))
          true false) (ite (and (<= 1 i1) (<= i1 100)) true false)) true))

(declare-const d__split_fields2 us_split_fields2)

;; H
  (assert
  (= d__split_fields2 (us_split_fieldsqtmk1
                      (store (rec__do_loops__r_array_record__f3
                             d__split_fields1) i1 (us_repqtmk
                                                  (us_split_fieldsqtmk
                                                  rliteral
                                                  (rec__do_loops__r__f2
                                                  (us_split_fields1
                                                  (select (rec__do_loops__r_array_record__f3
                                                          d__split_fields1) 
                                                  i1))))))
                      (rec__do_loops__r_array_record__f4 d__split_fields1))))

;; Assert
  (assert
  (= (to_rep
     (rec__do_loops__r__f2
     (us_split_fields1
     (select (rec__do_loops__r_array_record__f3 d__split_fields2) i1)))) 
  (to_rep (rec__do_loops__r__f2 (us_split_fields1 (select usf i1))))))

(assert
;; defqtvc
 ;; File "do_loops.adb", line 1, characters 0-0
  (not
  (= (bool_eq1 (rec__do_loops__r_array_record__f4 d__split_fields2) 1 100
     (rec__do_loops__r_array_record__f4 d__split_fields) 1 100) true)))
(check-sat)
