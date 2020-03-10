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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

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

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-fun user_eq2 (natural natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

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
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
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

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__main__discr_type__discr positive)))))
(define-fun us_split_discrs_rec__main__discr_type__discr__projection ((a us_split_discrs)) positive 
  (rec__main__discr_type__discr a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__main__discr_type__m_array us_t)))))
(define-fun us_split_fields_rec__main__discr_type__m_array__projection ((a us_split_fields)) us_t 
  (rec__main__discr_type__m_array a))

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

(declare-datatypes ((discr_type__ref 0))
(((discr_type__refqtmk (discr_type__content us_rep)))))
(define-fun discr_type__ref_discr_type__content__projection ((a discr_type__ref)) us_rep 
  (discr_type__content a))

(declare-const d__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

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

(declare-const r6b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((s5b__ref 0))
(((s5b__refqtmk (s5b__content us_t)))))
(define-fun s5b__ref_s5b__content__projection ((a s5b__ref)) us_t (s5b__content
                                                                  a))

(declare-datatypes ((t8b__ref 0))
(((t8b__refqtmk (t8b__content us_t)))))
(define-fun t8b__ref_t8b__content__projection ((a t8b__ref)) us_t (t8b__content
                                                                  a))

(declare-fun temp_____aggregate_def_220 (Int Int Int) us_t)

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

(define-fun dynamic_invariant4 ((temp___expr_181 us_t)
  (temp___is_init_177 Bool) (temp___skip_constant_178 Bool)
  (temp___do_toplevel_179 Bool)
  (temp___do_typ_inv_180 Bool)) Bool (=>
                                     (not (= temp___skip_constant_178 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_181)
                                     (last1 temp___expr_181))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___222 Int) (temp___223 Int) (temp___224 Int))
  (let ((temp___221 (temp_____aggregate_def_220 temp___222 temp___223
                    temp___224)))
  (=> (dynamic_invariant2 temp___222 true true true true)
  (and
  (=> (dynamic_property 0 2147483647 temp___223 temp___224)
  (and (= (first1 temp___221) temp___223) (= (last1 temp___221) temp___224)))
  (forall ((temp___225 Int))
  (= (select (to_array temp___221) temp___225) rliteral)))))))

(define-fun dynamic_invariant5 ((temp___expr_194 us_t)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (not (= temp___skip_constant_191 true))
                                     (and (dynamic_property 0 r6b
                                     (first1 temp___expr_194)
                                     (last1 temp___expr_194))
                                     (and (= (first1 temp___expr_194) 0)
                                     (= (last1 temp___expr_194) r6b)))))

(define-fun default_initial_assumption ((temp___expr_196 us_t)
  (temp___skip_top_level_197 Bool)) Bool (and (= (first1 temp___expr_196) 0)
                                         (= (last1 temp___expr_196) r6b)))

(assert
;; defqtvc
 ;; File "main.adb", line 11, characters 0-0
  (not
  (forall ((d__split_fields us_t) (main__set_discr_type__R6b__assume Int))
  (=> (dynamic_invariant1
  (us_repqtmk d__split_discrs (us_split_fieldsqtmk d__split_fields)) false
  false true true)
  (=>
  (= (to_rep (rec__main__discr_type__discr d__split_discrs)) main__set_discr_type__R6b__assume)
  (=> (= main__set_discr_type__R6b__assume r6b)
  (=> (dynamic_invariant r6b true false true true)
  (let ((temp___226 (temp_____aggregate_def_220 0 0 r6b)))
  (=> (= (first1 temp___226) 0)
  (=> (= (last1 temp___226) r6b)
  (=>
  (ite (<= (first1 temp___226) (last1 temp___226))
  (and (<= 0 r6b) (= (- (last1 temp___226) (first1 temp___226)) (- r6b 0)))
  (< r6b 0))
  (let ((temp___228 (of_array (to_array temp___226) (first1 temp___226)
                    (last1 temp___226))))
  (=> (<= (first1 temp___228) (last1 temp___228))
  (<= (first1 d__split_fields) (last1 d__split_fields)))))))))))))))
(check-sat)
(exit)
