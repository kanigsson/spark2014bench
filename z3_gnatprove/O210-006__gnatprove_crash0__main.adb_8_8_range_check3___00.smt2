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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ()
((array_type__ref (array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-datatypes () ((t4b__ref (t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__main__discr_type__discr positive)))))
(define-fun us_split_discrs_rec__main__discr_type__discr__projection ((a us_split_discrs)) positive 
  (rec__main__discr_type__discr a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__main__discr_type__m_array us_t)))))
(define-fun us_split_fields_rec__main__discr_type__m_array__projection ((a us_split_fields)) us_t 
  (rec__main__discr_type__m_array a))

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

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__main__discr_type__discr
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__main__discr_type__discr
                                                  (us_split_discrs1 b))))
                        (= (bool_eq1
                           (rec__main__discr_type__m_array
                           (us_split_fields1 a))
                           (rec__main__discr_type__m_array
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range3 ((rec__main__discr_type__discr1 Int)
  (a us_split_discrs)) Bool (= rec__main__discr_type__discr1 (to_rep
                                                             (rec__main__discr_type__discr
                                                             a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const main__discr_type__discr__first__bit Int)

(declare-const main__discr_type__discr__last__bit Int)

(declare-const main__discr_type__discr__position Int)

;; main__discr_type__discr__first__bit_axiom
  (assert (<= 0 main__discr_type__discr__first__bit))

;; main__discr_type__discr__last__bit_axiom
  (assert
  (< main__discr_type__discr__first__bit main__discr_type__discr__last__bit))

;; main__discr_type__discr__position_axiom
  (assert (<= 0 main__discr_type__discr__position))

(declare-const main__discr_type__m_array__first__bit Int)

(declare-const main__discr_type__m_array__last__bit Int)

(declare-const main__discr_type__m_array__position Int)

;; main__discr_type__m_array__first__bit_axiom
  (assert (<= 0 main__discr_type__m_array__first__bit))

;; main__discr_type__m_array__last__bit_axiom
  (assert
  (< main__discr_type__m_array__first__bit main__discr_type__m_array__last__bit))

;; main__discr_type__m_array__position_axiom
  (assert (<= 0 main__discr_type__m_array__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ()
((discr_type__ref (discr_type__refqtmk (discr_type__content us_rep)))))
(define-fun discr_type__ref_discr_type__content__projection ((a discr_type__ref)) us_rep 
  (discr_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_187 us_rep)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (let ((temp___188 (rec__main__discr_type__discr
                                                       (us_split_discrs1
                                                       temp___expr_187))))
                                     (and (dynamic_property 0
                                     (to_rep temp___188)
                                     (first1
                                     (rec__main__discr_type__m_array
                                     (us_split_fields1 temp___expr_187)))
                                     (last1
                                     (rec__main__discr_type__m_array
                                     (us_split_fields1 temp___expr_187))))
                                     (and
                                     (= (first1
                                        (rec__main__discr_type__m_array
                                        (us_split_fields1 temp___expr_187))) 0)
                                     (= (last1
                                        (rec__main__discr_type__m_array
                                        (us_split_fields1 temp___expr_187))) 
                                     (to_rep temp___188))))))

(declare-sort tT9bP1 0)

(declare-fun tT9bP1qtint (tT9bP1) Int)

;; tT9bP1'axiom
  (assert
  (forall ((i tT9bP1)) (and (<= 0 (tT9bP1qtint i)) (<= (tT9bP1qtint i) 15))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (tT9bP1 tT9bP1) Bool)

(declare-const dummy5 tT9bP1)

(declare-datatypes ()
((tT9bP1__ref (tT9bP1__refqtmk (tT9bP1__content tT9bP1)))))
(define-fun tT9bP1__ref_tT9bP1__content__projection ((a tT9bP1__ref)) tT9bP1 
  (tT9bP1__content a))

(declare-const dummy6 (Array Int integer))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq6 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1 (rec__main__discr_type__m_array1 (Array Int integer))))))
(define-fun us_split_fields_rec__main__discr_type__m_array__2__projection ((a us_split_fields2)) (Array Int integer) 
  (rec__main__discr_type__m_array1 a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (of_array
                                         (rec__main__discr_type__m_array1
                                         (us_split_fields3 a)) 0 15))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (let ((temp___155 (rec__main__discr_type__m_array
                                                           (us_split_fields1
                                                           r))))
                                         (to_array temp___155)))))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__main__discr_type__discr
                            (us_split_discrs2 a))) (to_rep
                                                   (rec__main__discr_type__discr
                                                   (us_split_discrs2 b))))
                         (= (bool_eq
                            (rec__main__discr_type__m_array1
                            (us_split_fields3 a)) 0 15
                            (rec__main__discr_type__m_array1
                            (us_split_fields3 b)) 0 15) true))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const main__discr_type__discr__first__bit1 Int)

(declare-const main__discr_type__discr__last__bit1 Int)

(declare-const main__discr_type__discr__position1 Int)

;; main__discr_type__discr__first__bit_axiom
  (assert (<= 0 main__discr_type__discr__first__bit1))

;; main__discr_type__discr__last__bit_axiom
  (assert
  (< main__discr_type__discr__first__bit1 main__discr_type__discr__last__bit1))

;; main__discr_type__discr__position_axiom
  (assert (<= 0 main__discr_type__discr__position1))

(declare-const main__discr_type__m_array__first__bit1 Int)

(declare-const main__discr_type__m_array__last__bit1 Int)

(declare-const main__discr_type__m_array__position1 Int)

;; main__discr_type__m_array__first__bit_axiom
  (assert (<= 0 main__discr_type__m_array__first__bit1))

;; main__discr_type__m_array__last__bit_axiom
  (assert
  (< main__discr_type__m_array__first__bit1 main__discr_type__m_array__last__bit1))

;; main__discr_type__m_array__position_axiom
  (assert (<= 0 main__discr_type__m_array__position1))

(declare-fun user_eq7 (us_rep1 us_rep1) Bool)

(declare-const dummy7 us_rep1)

(declare-datatypes () ((tdS__ref (tdS__refqtmk (tdS__content us_rep1)))))
(define-fun tdS__ref_tdS__content__projection ((a tdS__ref)) us_rep1 
  (tdS__content a))

(declare-const d__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant2 ((temp___expr_204 us_rep1)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (not (= temp___skip_constant_201 true))
                                     (in_range3 15
                                     (us_split_discrs1
                                     (to_base temp___expr_204)))))

(define-fun default_initial_assumption ((temp___expr_207 us_rep1)
  (temp___skip_top_level_208 Bool)) Bool (= (to_rep
                                            (rec__main__discr_type__discr
                                            (us_split_discrs2
                                            temp___expr_207))) 15))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-const d__split_fields (Array Int integer))

(declare-const usf Int)

;; Ensures
  (assert (dynamic_invariant usf true true true true))

(declare-const usf1 us_rep)

;; Ensures
  (assert
  (= (to_rep (rec__main__discr_type__discr (us_split_discrs1 usf1))) 
  usf))

;; H
  (assert (<= 0 usf))

(assert
;; defqtvc
 ;; File "main.adb", line 1, characters 0-0
  (not (<= 0 0)))
(check-sat)
