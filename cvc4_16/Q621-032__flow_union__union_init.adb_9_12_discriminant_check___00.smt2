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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

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

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
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
  (forall ((x natural)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

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

(declare-const dummy2 (Array Int integer))

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

(declare-fun user_eq2 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__union_init__basic_record__length integer)(rec__union_init__basic_record__basic_array (Array Int integer))))))
(define-fun us_split_fields_rec__union_init__basic_record__length__projection ((a us_split_fields)) integer 
  (rec__union_init__basic_record__length a))

(define-fun us_split_fields_rec__union_init__basic_record__basic_array__projection ((a us_split_fields)) (Array Int integer) 
  (rec__union_init__basic_record__basic_array a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__union_init__basic_record__length
                           (us_split_fields1 a))) (to_rep
                                                  (rec__union_init__basic_record__length
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__union_init__basic_record__basic_array
                           (us_split_fields1 a)) 0 2
                           (rec__union_init__basic_record__basic_array
                           (us_split_fields1 b)) 0 2) true))
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

(declare-const union_init__basic_record__length__first__bit Int)

(declare-const union_init__basic_record__length__last__bit Int)

(declare-const union_init__basic_record__length__position Int)

;; union_init__basic_record__length__first__bit_axiom
  (assert (<= 0 union_init__basic_record__length__first__bit))

;; union_init__basic_record__length__last__bit_axiom
  (assert
  (< union_init__basic_record__length__first__bit union_init__basic_record__length__last__bit))

;; union_init__basic_record__length__position_axiom
  (assert (<= 0 union_init__basic_record__length__position))

(declare-const union_init__basic_record__basic_array__first__bit Int)

(declare-const union_init__basic_record__basic_array__last__bit Int)

(declare-const union_init__basic_record__basic_array__position Int)

;; union_init__basic_record__basic_array__first__bit_axiom
  (assert (<= 0 union_init__basic_record__basic_array__first__bit))

;; union_init__basic_record__basic_array__last__bit_axiom
  (assert
  (< union_init__basic_record__basic_array__first__bit union_init__basic_record__basic_array__last__bit))

;; union_init__basic_record__basic_array__position_axiom
  (assert (<= 0 union_init__basic_record__basic_array__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((basic_record__ref 0))
(((basic_record__refqtmk (basic_record__content us_rep)))))
(define-fun basic_record__ref_basic_record__content__projection ((a basic_record__ref)) us_rep 
  (basic_record__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__union_init__union_test__discr integer)))))
(define-fun us_split_discrs_rec__union_init__union_test__discr__projection ((a us_split_discrs)) integer 
  (rec__union_init__union_test__discr a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__union_init__union_test__field1 integer)(rec__union_init__union_test__field2 us_rep)(rec__union_init__union_test__field3 natural)))))
(define-fun us_split_fields_rec__union_init__union_test__field1__projection ((a us_split_fields2)) integer 
  (rec__union_init__union_test__field1 a))

(define-fun us_split_fields_rec__union_init__union_test__field2__projection ((a us_split_fields2)) us_rep 
  (rec__union_init__union_test__field2 a))

(define-fun us_split_fields_rec__union_init__union_test__field3__projection ((a us_split_fields2)) natural 
  (rec__union_init__union_test__field3 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun union_init__union_test__field1__pred ((a us_rep1)) Bool (= 
  (to_rep (rec__union_init__union_test__discr (us_split_discrs1 a))) 0))

(define-fun union_init__union_test__field2__pred ((a us_rep1)) Bool (= 
  (to_rep (rec__union_init__union_test__discr (us_split_discrs1 a))) 1))

(define-fun union_init__union_test__field3__pred ((a us_rep1)) Bool (and
                                                                    (not
                                                                    (= 
                                                                    (to_rep
                                                                    (rec__union_init__union_test__discr
                                                                    (us_split_discrs1
                                                                    a))) 0))
                                                                    (not
                                                                    (= 
                                                                    (to_rep
                                                                    (rec__union_init__union_test__discr
                                                                    (us_split_discrs1
                                                                    a))) 1))))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__union_init__union_test__discr
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__union_init__union_test__discr
                                                   (us_split_discrs1 b))))
                         (and
                         (and
                         (=> (union_init__union_test__field1__pred a)
                         (= (to_rep
                            (rec__union_init__union_test__field1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__union_init__union_test__field1
                                                   (us_split_fields3 b)))))
                         (=> (union_init__union_test__field2__pred a)
                         (= (bool_eq1
                            (rec__union_init__union_test__field2
                            (us_split_fields3 a))
                            (rec__union_init__union_test__field2
                            (us_split_fields3 b))) true)))
                         (=> (union_init__union_test__field3__pred a)
                         (= (to_rep1
                            (rec__union_init__union_test__field3
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__union_init__union_test__field3
                                                   (us_split_fields3 b)))))))
                    true false))

(define-fun in_range2 ((rec__union_init__union_test__discr1 Int)
  (a us_split_discrs)) Bool (= rec__union_init__union_test__discr1 (to_rep
                                                                   (rec__union_init__union_test__discr
                                                                   a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const union_init__union_test__discr__first__bit Int)

(declare-const union_init__union_test__discr__last__bit Int)

(declare-const union_init__union_test__discr__position Int)

;; union_init__union_test__discr__first__bit_axiom
  (assert (<= 0 union_init__union_test__discr__first__bit))

;; union_init__union_test__discr__last__bit_axiom
  (assert
  (< union_init__union_test__discr__first__bit union_init__union_test__discr__last__bit))

;; union_init__union_test__discr__position_axiom
  (assert (<= 0 union_init__union_test__discr__position))

(declare-const union_init__union_test__field1__first__bit Int)

(declare-const union_init__union_test__field1__last__bit Int)

(declare-const union_init__union_test__field1__position Int)

;; union_init__union_test__field1__first__bit_axiom
  (assert (<= 0 union_init__union_test__field1__first__bit))

;; union_init__union_test__field1__last__bit_axiom
  (assert
  (< union_init__union_test__field1__first__bit union_init__union_test__field1__last__bit))

;; union_init__union_test__field1__position_axiom
  (assert (<= 0 union_init__union_test__field1__position))

(declare-const union_init__union_test__field2__first__bit Int)

(declare-const union_init__union_test__field2__last__bit Int)

(declare-const union_init__union_test__field2__position Int)

;; union_init__union_test__field2__first__bit_axiom
  (assert (<= 0 union_init__union_test__field2__first__bit))

;; union_init__union_test__field2__last__bit_axiom
  (assert
  (< union_init__union_test__field2__first__bit union_init__union_test__field2__last__bit))

;; union_init__union_test__field2__position_axiom
  (assert (<= 0 union_init__union_test__field2__position))

(declare-const union_init__union_test__field3__first__bit Int)

(declare-const union_init__union_test__field3__last__bit Int)

(declare-const union_init__union_test__field3__position Int)

;; union_init__union_test__field3__first__bit_axiom
  (assert (<= 0 union_init__union_test__field3__first__bit))

;; union_init__union_test__field3__last__bit_axiom
  (assert
  (< union_init__union_test__field3__first__bit union_init__union_test__field3__last__bit))

;; union_init__union_test__field3__position_axiom
  (assert (<= 0 union_init__union_test__field3__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((union_test__ref 0))
(((union_test__refqtmk (union_test__content us_rep1)))))
(define-fun union_test__ref_union_test__content__projection ((a union_test__ref)) us_rep1 
  (union_test__content a))

(declare-const test__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun temp_____aggregate_def_173 (Int) (Array Int integer))

(define-fun default_initial_assumption ((temp___expr_184 us_rep1)
  (temp___skip_top_level_185 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__union_init__union_test__discr
                                            (us_split_discrs1
                                            temp___expr_184))) 0)
                                         (and
                                         (and
                                         (=>
                                         (union_init__union_test__field1__pred
                                         temp___expr_184)
                                         (= (to_rep
                                            (rec__union_init__union_test__field1
                                            (us_split_fields3
                                            temp___expr_184))) 0))
                                         (=>
                                         (union_init__union_test__field2__pred
                                         temp___expr_184)
                                         (and
                                         (= (to_rep
                                            (rec__union_init__basic_record__length
                                            (us_split_fields1
                                            (rec__union_init__union_test__field2
                                            (us_split_fields3
                                            temp___expr_184))))) 0)
                                         (= (rec__union_init__basic_record__basic_array
                                            (us_split_fields1
                                            (rec__union_init__union_test__field2
                                            (us_split_fields3
                                            temp___expr_184)))) (temp_____aggregate_def_173
                                                                0)))))
                                         (=>
                                         (union_init__union_test__field3__pred
                                         temp___expr_184)
                                         (= (to_rep1
                                            (rec__union_init__union_test__field3
                                            (us_split_fields3
                                            temp___expr_184))) 0)))))

(declare-const r2b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const union_init__union_test__discr__first__bit1 Int)

(declare-const union_init__union_test__discr__last__bit1 Int)

(declare-const union_init__union_test__discr__position1 Int)

;; union_init__union_test__discr__first__bit_axiom
  (assert (<= 0 union_init__union_test__discr__first__bit1))

;; union_init__union_test__discr__last__bit_axiom
  (assert
  (< union_init__union_test__discr__first__bit1 union_init__union_test__discr__last__bit1))

;; union_init__union_test__discr__position_axiom
  (assert (<= 0 union_init__union_test__discr__position1))

(declare-const union_init__union_test__field1__first__bit1 Int)

(declare-const union_init__union_test__field1__last__bit1 Int)

(declare-const union_init__union_test__field1__position1 Int)

;; union_init__union_test__field1__first__bit_axiom
  (assert (<= 0 union_init__union_test__field1__first__bit1))

;; union_init__union_test__field1__last__bit_axiom
  (assert
  (< union_init__union_test__field1__first__bit1 union_init__union_test__field1__last__bit1))

;; union_init__union_test__field1__position_axiom
  (assert (<= 0 union_init__union_test__field1__position1))

(declare-const union_init__union_test__field3__first__bit1 Int)

(declare-const union_init__union_test__field3__last__bit1 Int)

(declare-const union_init__union_test__field3__position1 Int)

;; union_init__union_test__field3__first__bit_axiom
  (assert (<= 0 union_init__union_test__field3__first__bit1))

;; union_init__union_test__field3__last__bit_axiom
  (assert
  (< union_init__union_test__field3__first__bit1 union_init__union_test__field3__last__bit1))

;; union_init__union_test__field3__position_axiom
  (assert (<= 0 union_init__union_test__field3__position1))

(declare-const union_init__union_test__field2__first__bit1 Int)

(declare-const union_init__union_test__field2__last__bit1 Int)

(declare-const union_init__union_test__field2__position1 Int)

;; union_init__union_test__field2__first__bit_axiom
  (assert (<= 0 union_init__union_test__field2__first__bit1))

;; union_init__union_test__field2__last__bit_axiom
  (assert
  (< union_init__union_test__field2__first__bit1 union_init__union_test__field2__last__bit1))

;; union_init__union_test__field2__position_axiom
  (assert (<= 0 union_init__union_test__field2__position1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep1)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep1 
  (t3b__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun default_initial_assumption1 ((temp___expr_171 us_rep)
  (temp___skip_top_level_172 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__union_init__basic_record__length
                                            (us_split_fields1
                                            temp___expr_171))) 0)
                                         (= (rec__union_init__basic_record__basic_array
                                            (us_split_fields1
                                            temp___expr_171)) (temp_____aggregate_def_173
                                                              0))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___175 Int))
  (=> (dynamic_invariant temp___175 true true true true)
  (forall ((temp___176 Int))
  (= (select (temp_____aggregate_def_173 temp___175) temp___176) rliteral)))))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 1))

(assert
;; defqtvc
 ;; File "union_init.ads", line 23, characters 0-0
  (not
  (forall ((test__split_discrs integer)
  (union_init__init_union__R2b__assume Int))
  (=> (= (to_rep test__split_discrs) union_init__init_union__R2b__assume)
  (=> (= union_init__init_union__R2b__assume r2b)
  (=> (dynamic_invariant r2b true false true true)
  (=> (= test__attr__constrained true) (= rliteral1 test__split_discrs))))))))
(check-sat)
(exit)
