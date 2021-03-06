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

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
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
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
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
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
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
((nat_array__ref (nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const first2 Int)

(declare-const last2 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ()
((a_range__ref (a_range__refqtmk (a_range__content integer)))))
(define-fun a_range__ref_a_range__content__projection ((a1 a_range__ref)) integer 
  (a_range__content a1))

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int integer))))))
(declare-fun slide1 ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((first3 Int))
  (! (= (slide1 a1 first3 first3) a1) :pattern ((slide1 a1 first3 first3)) ))))

;; slide_def
  (assert
  (forall ((a1 (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a1 old_first new_first) i) (select a1 (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a1 old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a1 (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep1 (select a1 temp___idx_156)) (to_rep1
                                                                   (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a1 (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a1 a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep1 (select a1 temp___idx_156)) (to_rep1
                                          (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-const dummy5 (Array Int integer))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq5 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__dynamic_types__search__result_type__from (Array Int integer))(rec__dynamic_types__search__result_type__result natural)))))
(define-fun us_split_fields_rec__dynamic_types__search__result_type__from__projection ((a1 us_split_fields)) (Array Int integer) 
  (rec__dynamic_types__search__result_type__from a1))

(define-fun us_split_fields_rec__dynamic_types__search__result_type__result__projection ((a1 us_split_fields)) natural 
  (rec__dynamic_types__search__result_type__result a1))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a1 us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a1))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a1 us_rep)) us_split_fields 
  (us_split_fields1 a1))

(define-fun bool_eq3 ((a1 us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq2
                           (rec__dynamic_types__search__result_type__from
                           (us_split_fields1 a1)) 1 1
                           (rec__dynamic_types__search__result_type__from
                           (us_split_fields1 b)) 1 1) true)
                        (= (to_rep
                           (rec__dynamic_types__search__result_type__result
                           (us_split_fields1 a1))) (to_rep
                                                   (rec__dynamic_types__search__result_type__result
                                                   (us_split_fields1 b)))))
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

(declare-const dynamic_types__search__result_type__from__first__bit Int)

(declare-const dynamic_types__search__result_type__from__last__bit Int)

(declare-const dynamic_types__search__result_type__from__position Int)

;; dynamic_types__search__result_type__from__first__bit_axiom
  (assert (<= 0 dynamic_types__search__result_type__from__first__bit))

;; dynamic_types__search__result_type__from__last__bit_axiom
  (assert
  (< dynamic_types__search__result_type__from__first__bit dynamic_types__search__result_type__from__last__bit))

;; dynamic_types__search__result_type__from__position_axiom
  (assert (<= 0 dynamic_types__search__result_type__from__position))

(declare-const dynamic_types__search__result_type__result__first__bit Int)

(declare-const dynamic_types__search__result_type__result__last__bit Int)

(declare-const dynamic_types__search__result_type__result__position Int)

;; dynamic_types__search__result_type__result__first__bit_axiom
  (assert (<= 0 dynamic_types__search__result_type__result__first__bit))

;; dynamic_types__search__result_type__result__last__bit_axiom
  (assert
  (< dynamic_types__search__result_type__result__first__bit dynamic_types__search__result_type__result__last__bit))

;; dynamic_types__search__result_type__result__position_axiom
  (assert (<= 0 dynamic_types__search__result_type__result__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((result_type__ref (result_type__refqtmk (result_type__content us_rep)))))
(define-fun result_type__ref_result_type__content__projection ((a1 result_type__ref)) us_rep 
  (result_type__content a1))

(declare-fun search_range (Int) us_rep)

(declare-fun search_range__function_guard (us_rep Int) Bool)

(declare-sort twrapperD1 0)

(declare-fun twrapperD1qtint (twrapperD1) Int)

;; twrapperD1'axiom
  (assert
  (forall ((i twrapperD1))
  (and (<= 1 (twrapperD1qtint i)) (<= (twrapperD1qtint i) 1))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (twrapperD1 twrapperD1) Bool)

(declare-const dummy7 twrapperD1)

(declare-datatypes ()
((twrapperD1__ref (twrapperD1__refqtmk (twrapperD1__content twrapperD1)))))
(define-fun twrapperD1__ref_twrapperD1__content__projection ((a1 twrapperD1__ref)) twrapperD1 
  (twrapperD1__content a1))

(define-fun dynamic_invariant1 ((temp___expr_196 us_rep)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (forall ((temp___197 Int))
                                     (=>
                                     (and (<= 1 temp___197)
                                     (<= temp___197 1))
                                     (=>
                                     (or (= temp___is_init_192 true)
                                     (<= first2 last2)) (dynamic_property1
                                     first2 last2
                                     (to_rep1
                                     (select (rec__dynamic_types__search__result_type__from
                                             (us_split_fields1
                                             temp___expr_196)) temp___197)))))))

;; search_range__post_axiom
  (assert
  (forall ((from Int))
  (! (=>
     (and (dynamic_invariant from true true true true)
     (and (<= (first1 a) from) (<= from (last1 a))))
     (let ((result (search_range from)))
     (=> (search_range__function_guard result from)
     (and
     (or
     (and
     (= (to_rep
        (rec__dynamic_types__search__result_type__result
        (us_split_fields1 result))) 0)
     (forall ((i Int))
     (=>
     (and (<= from i)
     (<= i (to_rep1
           (let ((temp___206 (rec__dynamic_types__search__result_type__from
                             (us_split_fields1 result))))
           (select temp___206 1)))))
     (not (= (to_rep (select (to_array a) i)) c)))))
     (and
     (let ((temp___207 (to_rep
                       (rec__dynamic_types__search__result_type__result
                       (us_split_fields1 result)))))
     (and (<= (first1 a) temp___207) (<= temp___207 (last1 a))))
     (= (to_rep
        (select (to_array a) (to_rep
                             (rec__dynamic_types__search__result_type__result
                             (us_split_fields1 result))))) c)))
     (dynamic_invariant1 result true false true true))))) :pattern ((search_range
                                                                    from)) )))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant2 ((temp___expr_162 us_t)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (not (= temp___skip_constant_159 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_162)
                                     (last1 temp___expr_162))))

(define-fun dynamic_invariant3 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= first2 last2)) (dynamic_property1
                                     first2 last2 temp___expr_179)))

;; first__def_axiom
  (assert (= first2 (first1 a)))

;; last__def_axiom
  (assert (= last2 (last1 a)))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant6 ((temp___expr_186 (Array Int integer))
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (forall ((temp___187 Int))
                                     (=>
                                     (and (<= 1 temp___187)
                                     (<= temp___187 1))
                                     (=>
                                     (or (= temp___is_init_182 true)
                                     (<= first2 last2)) (dynamic_property1
                                     first2 last2
                                     (to_rep1
                                     (select temp___expr_186 temp___187)))))))

(declare-const result__ Int)

(declare-const tmp__split_fields us_split_fields)

(declare-const dynamic_types__search__result Int)

;; Assume
  (assert (dynamic_invariant2 a true false true true))

;; Assume
  (assert (dynamic_invariant c true false true true))

;; Assume
  (assert (<= (first1 a) (last1 a)))

(define-fun temp___209 () Int (first1 a))

(define-fun o () Int last2)

(define-fun o1 () Int first2)

;; Ensures
  (assert (dynamic_property1 o1 o temp___209))

(declare-const from Int)

;; H
  (assert (= from temp___209))

;; Assume
  (assert (dynamic_invariant3 from true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant result__ false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 (us_repqtmk tmp__split_fields) false false true
  true))

;; Ensures
  (assert (in_range1 (- from 1)))

(declare-const from1 Int)

(declare-const result__1 Int)

(declare-const tmp__split_fields1 us_split_fields)

;; LoopInvariant
  (assert
  (forall ((i Int))
  (=> (and (<= (first1 a) i) (<= i (- from1 1)))
  (not (= (to_rep (select (to_array a) i)) c)))))

;; Assume
  (assert
  (and
  (and (dynamic_invariant3 from1 true true true true) (dynamic_invariant
  result__1 false true true true)) (dynamic_invariant1
  (us_repqtmk tmp__split_fields1) false true true true)))

;; Ensures
  (assert (in_range2 from1))

(define-fun temp___212 () us_rep (search_range from1))

;; H
  (assert (search_range__function_guard temp___212 from1))

;; H
  (assert (dynamic_invariant1 temp___212 true false true true))

;; H
  (assert
  (or
  (and
  (= (to_rep
     (rec__dynamic_types__search__result_type__result
     (us_split_fields1 temp___212))) 0)
  (forall ((i Int))
  (=>
  (and (<= from1 i)
  (<= i (to_rep1
        (select (rec__dynamic_types__search__result_type__from
                (us_split_fields1 temp___212)) 1))))
  (not (= (to_rep (select (to_array a) i)) c)))))
  (and
  (let ((temp___205 (to_rep
                    (rec__dynamic_types__search__result_type__result
                    (us_split_fields1 temp___212)))))
  (and (<= (first1 a) temp___205) (<= temp___205 (last1 a))))
  (= (to_rep
     (select (to_array a) (to_rep
                          (rec__dynamic_types__search__result_type__result
                          (us_split_fields1 temp___212))))) c))))

(declare-const tmp__split_fields2 us_split_fields)

;; H
  (assert (= tmp__split_fields2 (us_split_fields1 temp___212)))

(declare-const o2 Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__dynamic_types__search__result_type__result tmp__split_fields2)) 
  o2))

(declare-const result__2 Int)

;; H
  (assert (= result__2 o2))

(declare-const from2 Int)

;; H
  (assert
  (= from2 (to_rep1
           (select (rec__dynamic_types__search__result_type__from
                   tmp__split_fields2) 1))))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (< 0 result__2) true false)))

;; H
  (assert (not (= spark__branch true)))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (= from2 (last1 a)) true false)))

;; H
  (assert (not (= spark__branch1 true)))

(define-fun o3 () Int (+ from2 1))

;; Ensures
  (assert (in_range1 o3))

(define-fun o4 () Int last2)

(define-fun o5 () Int first2)

(assert
;; defqtvc
 ;; File "dynamic_types.ads", line 4, characters 0-0
  (not (dynamic_property1 o5 o4 o3)))
(check-sat)

(exit)
