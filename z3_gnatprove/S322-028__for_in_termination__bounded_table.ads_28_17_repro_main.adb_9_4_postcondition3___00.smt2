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

(declare-sort opt_index_type 0)

(declare-fun opt_index_typeqtint (opt_index_type) Int)

;; opt_index_type'axiom
  (assert
  (forall ((i opt_index_type))
  (and (<= 0 (opt_index_typeqtint i)) (<= (opt_index_typeqtint i) 32))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 32)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (opt_index_type opt_index_type) Bool)

(declare-const dummy1 opt_index_type)

(declare-datatypes ()
((opt_index_type__ref
 (opt_index_type__refqtmk (opt_index_type__content opt_index_type)))))
(define-fun opt_index_type__ref_opt_index_type__content__projection ((a opt_index_type__ref)) opt_index_type 
  (opt_index_type__content a))

(define-fun to_rep ((x opt_index_type)) Int (opt_index_typeqtint x))

(declare-fun of_rep (Int) opt_index_type)

;; inversion_axiom
  (assert
  (forall ((x opt_index_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x opt_index_type)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort elem_type 0)

(declare-fun elem_typeqtint (elem_type) Int)

;; elem_type'axiom
  (assert
  (forall ((i elem_type))
  (and (<= (- 2147483648) (elem_typeqtint i))
  (<= (elem_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (elem_type elem_type) Bool)

(declare-const dummy2 elem_type)

(declare-datatypes ()
((elem_type__ref (elem_type__refqtmk (elem_type__content elem_type)))))
(define-fun elem_type__ref_elem_type__content__projection ((a elem_type__ref)) elem_type 
  (elem_type__content a))

(define-fun to_rep1 ((x elem_type)) Int (elem_typeqtint x))

(declare-fun of_rep1 (Int) elem_type)

;; inversion_axiom
  (assert
  (forall ((x elem_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x elem_type)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int elem_type))))))
(declare-fun slide ((Array Int elem_type) Int Int) (Array Int elem_type))

;; slide_eq
  (assert
  (forall ((a (Array Int elem_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int elem_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int elem_type)) (a__first Int) (a__last Int)
  (b (Array Int elem_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep1 (select a temp___idx_156)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int elem_type)) (b (Array Int elem_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep1 (select a temp___idx_156)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-const dummy3 (Array Int elem_type))

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

(declare-fun user_eq3 ((Array Int elem_type) (Array Int elem_type)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__repro_main__int_table__t__elems (Array Int elem_type))(rec__repro_main__int_table__t__last opt_index_type)))))
(define-fun us_split_fields_rec__repro_main__int_table__t__elems__projection ((a us_split_fields)) (Array Int elem_type) 
  (rec__repro_main__int_table__t__elems a))

(define-fun us_split_fields_rec__repro_main__int_table__t__last__projection ((a us_split_fields)) opt_index_type 
  (rec__repro_main__int_table__t__last a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__repro_main__int_table__t__elems
                           (us_split_fields1 a)) 1 32
                           (rec__repro_main__int_table__t__elems
                           (us_split_fields1 b)) 1 32) true)
                        (= (to_rep
                           (rec__repro_main__int_table__t__last
                           (us_split_fields1 a))) (to_rep
                                                  (rec__repro_main__int_table__t__last
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

(declare-const repro_main__int_table__t__elems__first__bit Int)

(declare-const repro_main__int_table__t__elems__last__bit Int)

(declare-const repro_main__int_table__t__elems__position Int)

;; repro_main__int_table__t__elems__first__bit_axiom
  (assert (<= 0 repro_main__int_table__t__elems__first__bit))

;; repro_main__int_table__t__elems__last__bit_axiom
  (assert
  (< repro_main__int_table__t__elems__first__bit repro_main__int_table__t__elems__last__bit))

;; repro_main__int_table__t__elems__position_axiom
  (assert (<= 0 repro_main__int_table__t__elems__position))

(declare-const repro_main__int_table__t__last__first__bit Int)

(declare-const repro_main__int_table__t__last__last__bit Int)

(declare-const repro_main__int_table__t__last__position Int)

;; repro_main__int_table__t__last__first__bit_axiom
  (assert (<= 0 repro_main__int_table__t__last__first__bit))

;; repro_main__int_table__t__last__last__bit_axiom
  (assert
  (< repro_main__int_table__t__last__first__bit repro_main__int_table__t__last__last__bit))

;; repro_main__int_table__t__last__position_axiom
  (assert (<= 0 repro_main__int_table__t__last__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (natural natural) Bool)

(declare-const dummy5 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

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

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int elem_type))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int elem_type) (elts a))

(define-fun of_array ((a (Array Int elem_type)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq6 (us_t us_t) Bool)

(declare-const dummy6 us_t)

(declare-datatypes ()
((model_type__ref (model_type__refqtmk (model_type__content us_t)))))
(define-fun model_type__ref_model_type__content__projection ((a model_type__ref)) us_t 
  (model_type__content a))

(declare-fun model1 (us_rep) us_t)

(declare-fun model__function_guard (us_t us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_249 us_t)
  (temp___is_init_245 Bool) (temp___skip_constant_246 Bool)
  (temp___do_toplevel_247 Bool)
  (temp___do_typ_inv_248 Bool)) Bool (=>
                                     (not (= temp___skip_constant_246 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_249)
                                     (last1 temp___expr_249))))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 32))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 32)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (index_type index_type) Bool)

(declare-const dummy7 index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last2 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep2 (first2 (mk1 f l))) f)
     (= (to_rep2 (last2 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ()
((us_t1 (us_tqtmk1 (elts1 (Array Int elem_type))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int elem_type) (elts1 a))

(define-fun of_array1 ((a (Array Int elem_type)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep2 (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep2 (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size2 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment3))

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq (elts1 x) (to_rep2 (first2 (rt1 x)))
                  (to_rep2 (last2 (rt1 x))) (elts1 y)
                  (to_rep2 (first2 (rt1 y))) (to_rep2 (last2 (rt1 y)))))

(declare-fun user_eq8 (us_t1 us_t1) Bool)

(declare-const dummy8 us_t1)

(declare-datatypes ()
((telem_arrayB__ref (telem_arrayB__refqtmk (telem_arrayB__content us_t1)))))
(define-fun telem_arrayB__ref_telem_arrayB__content__projection ((a telem_arrayB__ref)) us_t1 
  (telem_arrayB__content a))

(declare-datatypes () ((t38b__ref (t38b__refqtmk (t38b__content us_t1)))))
(define-fun t38b__ref_t38b__content__projection ((a t38b__ref)) us_t1 
  (t38b__content a))

;; model__post_axiom
  (assert
  (forall ((table us_rep))
  (! (let ((result (model1 table)))
     (=> (model__function_guard result table) (dynamic_invariant result true
     false true true))) :pattern ((model1 table)) )))

;; model__def_axiom
  (assert
  (forall ((table us_rep))
  (! (= (model1 table) (let ((temp___258 (let ((temp___256 (to_rep
                                                           (rec__repro_main__int_table__t__last
                                                           (us_split_fields1
                                                           table)))))
                                         (let ((temp___255 1))
                                         (let ((temp___257 (rec__repro_main__int_table__t__elems
                                                           (us_split_fields1
                                                           table))))
                                         (of_array1 temp___257 temp___255
                                         temp___256))))))
                       (of_array (to_array1 temp___258) (first3 temp___258)
                       (last3 temp___258)))) :pattern ((model1 table)) )))

(declare-const table us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range3
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_213 Int)
  (temp___is_init_209 Bool) (temp___skip_constant_210 Bool)
  (temp___do_toplevel_211 Bool)
  (temp___do_typ_inv_212 Bool)) Bool (=>
                                     (or (= temp___is_init_209 true)
                                     (<= 0 32)) (in_range1 temp___expr_213)))

(define-fun dynamic_invariant4 ((temp___expr_199 Int)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (=>
                                     (or (= temp___is_init_195 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_199)))

;; Assume
  (assert true)

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep (rec__repro_main__int_table__t__last (us_split_fields1 table))) 
  o))

(declare-const repro_main__int_table__length__result Int)

;; H
  (assert (= repro_main__int_table__length__result o))

;; H
  (assert (model__function_guard (model1 table) table))

(assert
;; defqtvc
 ;; File "bounded_table.ads", line 27, characters 0-0
  (not (= repro_main__int_table__length__result (length (model1 table)))))
(check-sat)

(exit)
