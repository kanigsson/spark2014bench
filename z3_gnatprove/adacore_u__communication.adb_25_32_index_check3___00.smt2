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
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x positive)) Int (positiveqtint x))

(declare-fun of_rep1 (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-const max Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                             (of_rep2 x))) )))

(declare-sort data 0)

(declare-fun dataqtint (data) Int)

;; data'axiom
  (assert
  (forall ((i data))
  (and (<= (- 2147483648) (dataqtint i)) (<= (dataqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (data data) Bool)

(declare-const dummy3 data)

(declare-datatypes () ((data__ref (data__refqtmk (data__content data)))))
(define-fun data__ref_data__content__projection ((a data__ref)) data 
  (data__content a))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ()
((tdata_arrayD1__ref
 (tdata_arrayD1__refqtmk (tdata_arrayD1__content integer)))))
(define-fun tdata_arrayD1__ref_tdata_arrayD1__content__projection ((a tdata_arrayD1__ref)) integer 
  (tdata_arrayD1__content a))

(define-fun to_rep3 ((x data)) Int (dataqtint x))

(declare-fun of_rep3 (Int) data)

;; inversion_axiom
  (assert
  (forall ((x data)) (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x data)) (! (in_range3 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int data))))))
(declare-fun slide ((Array Int data) Int Int) (Array Int data))

;; slide_eq
  (assert
  (forall ((a (Array Int data)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int data)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int data)) (a__first Int) (a__last Int)
  (b (Array Int data)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep3 (select a temp___idx_155)) (to_rep3
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int data)) (b (Array Int data)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep3 (select a temp___idx_155)) (to_rep3
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int data))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int data) (elts a))

(define-fun of_array ((a (Array Int data)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ()
((tdata_arrayB__ref (tdata_arrayB__refqtmk (tdata_arrayB__content us_t)))))
(define-fun tdata_arrayB__ref_tdata_arrayB__content__projection ((a tdata_arrayB__ref)) us_t 
  (tdata_arrayB__content a))

(declare-datatypes ()
((data_array__ref (data_array__refqtmk (data_array__content us_t)))))
(define-fun data_array__ref_data_array__content__projection ((a data_array__ref)) us_t 
  (data_array__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__communication__ring_buffer__buffer__content us_t)(rec__communication__ring_buffer__buffer__first positive)(rec__communication__ring_buffer__buffer__length natural)))))
(define-fun us_split_fields_rec__communication__ring_buffer__buffer__content__projection ((a us_split_fields)) us_t 
  (rec__communication__ring_buffer__buffer__content a))

(define-fun us_split_fields_rec__communication__ring_buffer__buffer__first__projection ((a us_split_fields)) positive 
  (rec__communication__ring_buffer__buffer__first a))

(define-fun us_split_fields_rec__communication__ring_buffer__buffer__length__projection ((a us_split_fields)) natural 
  (rec__communication__ring_buffer__buffer__length a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (bool_eq1
                           (rec__communication__ring_buffer__buffer__content
                           (us_split_fields1 a))
                           (rec__communication__ring_buffer__buffer__content
                           (us_split_fields1 b))) true)
                        (= (to_rep1
                           (rec__communication__ring_buffer__buffer__first
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__communication__ring_buffer__buffer__first
                                                  (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__communication__ring_buffer__buffer__length
                           (us_split_fields1 a))) (to_rep
                                                  (rec__communication__ring_buffer__buffer__length
                                                  (us_split_fields1 b)))))
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

(declare-const communication__ring_buffer__buffer__content__first__bit Int)

(declare-const communication__ring_buffer__buffer__content__last__bit Int)

(declare-const communication__ring_buffer__buffer__content__position Int)

;; communication__ring_buffer__buffer__content__first__bit_axiom
  (assert (<= 0 communication__ring_buffer__buffer__content__first__bit))

;; communication__ring_buffer__buffer__content__last__bit_axiom
  (assert
  (< communication__ring_buffer__buffer__content__first__bit communication__ring_buffer__buffer__content__last__bit))

;; communication__ring_buffer__buffer__content__position_axiom
  (assert (<= 0 communication__ring_buffer__buffer__content__position))

(declare-const communication__ring_buffer__buffer__first__first__bit Int)

(declare-const communication__ring_buffer__buffer__first__last__bit Int)

(declare-const communication__ring_buffer__buffer__first__position Int)

;; communication__ring_buffer__buffer__first__first__bit_axiom
  (assert (<= 0 communication__ring_buffer__buffer__first__first__bit))

;; communication__ring_buffer__buffer__first__last__bit_axiom
  (assert
  (< communication__ring_buffer__buffer__first__first__bit communication__ring_buffer__buffer__first__last__bit))

;; communication__ring_buffer__buffer__first__position_axiom
  (assert (<= 0 communication__ring_buffer__buffer__first__position))

(declare-const communication__ring_buffer__buffer__length__first__bit Int)

(declare-const communication__ring_buffer__buffer__length__last__bit Int)

(declare-const communication__ring_buffer__buffer__length__position Int)

;; communication__ring_buffer__buffer__length__first__bit_axiom
  (assert (<= 0 communication__ring_buffer__buffer__length__first__bit))

;; communication__ring_buffer__buffer__length__last__bit_axiom
  (assert
  (< communication__ring_buffer__buffer__length__first__bit communication__ring_buffer__buffer__length__last__bit))

;; communication__ring_buffer__buffer__length__position_axiom
  (assert (<= 0 communication__ring_buffer__buffer__length__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((buffer__ref (buffer__refqtmk (buffer__content us_rep)))))
(define-fun buffer__ref_buffer__content__projection ((a buffer__ref)) us_rep 
  (buffer__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_178 us_rep)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (and (dynamic_property1 1 max
                                     (first1
                                     (rec__communication__ring_buffer__buffer__content
                                     (us_split_fields1 temp___expr_178)))
                                     (last1
                                     (rec__communication__ring_buffer__buffer__content
                                     (us_split_fields1 temp___expr_178))))
                                     (and
                                     (= (first1
                                        (rec__communication__ring_buffer__buffer__content
                                        (us_split_fields1 temp___expr_178))) 1)
                                     (= (last1
                                        (rec__communication__ring_buffer__buffer__content
                                        (us_split_fields1 temp___expr_178))) 
                                     max))))

(define-fun default_initial_assumption ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (and
                                         (and
                                         (and
                                         (= (first1
                                            (rec__communication__ring_buffer__buffer__content
                                            (us_split_fields1
                                            temp___expr_180))) 1)
                                         (= (last1
                                            (rec__communication__ring_buffer__buffer__content
                                            (us_split_fields1
                                            temp___expr_180))) max))
                                         (= (to_rep1
                                            (rec__communication__ring_buffer__buffer__first
                                            (us_split_fields1
                                            temp___expr_180))) 1))
                                         (= (to_rep
                                            (rec__communication__ring_buffer__buffer__length
                                            (us_split_fields1
                                            temp___expr_180))) 0)))

(define-fun dynamic_invariant2 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_161)))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant5 ((temp___expr_168 us_t)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (not (= temp___skip_constant_165 true))
                                     (and (dynamic_property1 1 max
                                     (first1 temp___expr_168)
                                     (last1 temp___expr_168))
                                     (and (= (first1 temp___expr_168) 1)
                                     (= (last1 temp___expr_168) max)))))

(define-fun default_initial_assumption1 ((temp___expr_170 us_t)
  (temp___skip_top_level_171 Bool)) Bool (and (= (first1 temp___expr_170) 1)
                                         (= (last1 temp___expr_170) max)))

(declare-const b__split_fields us_split_fields)

;; Assume
  (assert (dynamic_invariant2 e true false true true))

;; Assume
  (assert (dynamic_invariant1 (us_repqtmk b__split_fields) true false true
  true))

;; Assume
  (assert (dynamic_invariant max true false true true))

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__communication__ring_buffer__buffer__length b__split_fields)) 
  o))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (<= max o) true false)))

;; H
  (assert (not (= spark__branch true)))

(declare-const o1 Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__communication__ring_buffer__buffer__length b__split_fields)) 
  o1))

(declare-const o2 Int)

;; Ensures
  (assert
  (= (to_rep1
     (rec__communication__ring_buffer__buffer__first b__split_fields)) 
  o2))

(define-fun o3 () Int (+ o2 o1))

;; Ensures
  (assert (in_range o3))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (<= max o3) true false)))

;; H
  (assert (not (= spark__branch1 true)))

(define-fun temp___269 () us_t (rec__communication__ring_buffer__buffer__content
                               b__split_fields))

(declare-const o4 data)

;; Ensures
  (assert (= (to_rep3 o4) e))

(declare-const o5 Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__communication__ring_buffer__buffer__length b__split_fields)) 
  o5))

(declare-const o6 Int)

;; Ensures
  (assert
  (= (to_rep1
     (rec__communication__ring_buffer__buffer__first b__split_fields)) 
  o6))

(define-fun o7 () Int (+ o6 o5))

;; Ensures
  (assert (in_range o7))

(assert
;; defqtvc
 ;; File "communication.ads", line 17, characters 0-0
  (not (<= (first1 temp___269) o7)))
(check-sat)
