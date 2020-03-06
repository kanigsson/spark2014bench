;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort less_than_max 0)

(declare-fun less_than_maxqtint (less_than_max) Int)

;; less_than_max'axiom
  (assert
  (forall ((i less_than_max))
  (and (<= 0 (less_than_maxqtint i)) (<= (less_than_maxqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (less_than_max less_than_max) Bool)

(declare-const dummy1 less_than_max)

(declare-datatypes ()
((less_than_max__ref
 (less_than_max__refqtmk (less_than_max__content less_than_max)))))
(define-fun less_than_max__ref_less_than_max__content__projection ((a less_than_max__ref)) less_than_max 
  (less_than_max__content a))

(define-fun to_rep ((x less_than_max)) Int (less_than_maxqtint x))

(declare-fun of_rep (Int) less_than_max)

;; inversion_axiom
  (assert
  (forall ((x less_than_max))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x less_than_max)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort element 0)

(declare-fun elementqtint (element) Int)

;; element'axiom
  (assert
  (forall ((i element))
  (and (<= 0 (elementqtint i)) (<= (elementqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (element element) Bool)

(declare-const dummy2 element)

(declare-datatypes ()
((element__ref (element__refqtmk (element__content element)))))
(define-fun element__ref_element__content__projection ((a element__ref)) element 
  (element__content a))

(define-fun to_rep1 ((x element)) Int (elementqtint x))

(declare-fun of_rep1 (Int) element)

;; inversion_axiom
  (assert
  (forall ((x element))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x element)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int element))))))
(declare-fun slide ((Array Int element) Int Int) (Array Int element))

;; slide_eq
  (assert
  (forall ((a (Array Int element)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element)) (a__first Int) (a__last Int)
  (b (Array Int element)) (b__first Int)
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
  (forall ((a (Array Int element)) (b (Array Int element)))
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

(declare-const dummy3 (Array Int element))

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

(declare-fun user_eq3 ((Array Int element) (Array Int element)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__stacks__stack_root__content (Array Int element))(rec__stacks__stack_root__length less_than_max)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__stacks__stack_root__content__projection ((a us_split_fields)) (Array Int element) 
  (rec__stacks__stack_root__content a))

(define-fun us_split_fields_rec__stacks__stack_root__length__projection ((a us_split_fields)) less_than_max 
  (rec__stacks__stack_root__length a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__stacks__stack_root__content
                           (us_split_fields1 a)) 1 100
                           (rec__stacks__stack_root__content
                           (us_split_fields1 b)) 1 100) true)
                        (= (to_rep
                           (rec__stacks__stack_root__length
                           (us_split_fields1 a))) (to_rep
                                                  (rec__stacks__stack_root__length
                                                  (us_split_fields1 b)))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const stacks__stack_root__content__first__bit Int)

(declare-const stacks__stack_root__content__last__bit Int)

(declare-const stacks__stack_root__content__position Int)

;; stacks__stack_root__content__first__bit_axiom
  (assert (<= 0 stacks__stack_root__content__first__bit))

;; stacks__stack_root__content__last__bit_axiom
  (assert
  (< stacks__stack_root__content__first__bit stacks__stack_root__content__last__bit))

;; stacks__stack_root__content__position_axiom
  (assert (<= 0 stacks__stack_root__content__position))

(declare-const stacks__stack_root__length__first__bit Int)

(declare-const stacks__stack_root__length__last__bit Int)

(declare-const stacks__stack_root__length__position Int)

;; stacks__stack_root__length__first__bit_axiom
  (assert (<= 0 stacks__stack_root__length__first__bit))

;; stacks__stack_root__length__last__bit_axiom
  (assert
  (< stacks__stack_root__length__first__bit stacks__stack_root__length__last__bit))

;; stacks__stack_root__length__position_axiom
  (assert (<= 0 stacks__stack_root__length__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ()
((stack_root__ref (stack_root__refqtmk (stack_root__content us_rep)))))
(define-fun stack_root__ref_stack_root__content__projection ((a stack_root__ref)) us_rep 
  (stack_root__content a))

(declare-fun size (us_rep) Int)

(declare-fun size__function_guard (Int us_rep) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range low) (in_range high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int element))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int element) (elts a))

(define-fun of_array ((a (Array Int element)) (f Int)
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

(declare-datatypes () ((model__ref (model__refqtmk (model__content us_t)))))
(define-fun model__ref_model__content__projection ((a model__ref)) us_t 
  (model__content a))

(declare-const us_tag1 Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const stacks__stack_root__content__first__bit1 Int)

(declare-const stacks__stack_root__content__last__bit1 Int)

(declare-const stacks__stack_root__content__position1 Int)

;; stacks__stack_root__content__first__bit_axiom
  (assert (<= 0 stacks__stack_root__content__first__bit1))

;; stacks__stack_root__content__last__bit_axiom
  (assert
  (< stacks__stack_root__content__first__bit1 stacks__stack_root__content__last__bit1))

;; stacks__stack_root__content__position_axiom
  (assert (<= 0 stacks__stack_root__content__position1))

(declare-const stacks__stack_root__length__first__bit1 Int)

(declare-const stacks__stack_root__length__last__bit1 Int)

(declare-const stacks__stack_root__length__position1 Int)

;; stacks__stack_root__length__first__bit_axiom
  (assert (<= 0 stacks__stack_root__length__first__bit1))

;; stacks__stack_root__length__last__bit_axiom
  (assert
  (< stacks__stack_root__length__first__bit1 stacks__stack_root__length__last__bit1))

;; stacks__stack_root__length__position_axiom
  (assert (<= 0 stacks__stack_root__length__position1))

(declare-fun user_eq7 (us_rep us_rep) Bool)

(declare-const dummy7 us_rep)

(declare-datatypes ()
((stack__ref (stack__refqtmk (stack__content us_rep)))))
(define-fun stack__ref_stack__content__projection ((a stack__ref)) us_rep 
  (stack__content a))

(declare-const s us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun temp_____aggregate_def_200 (Int) (Array Int element))

;; temp___result_427'def
  (assert
  (forall ((temp___426 us_rep)) (size__function_guard (size temp___426)
  temp___426)))

(define-fun default_initial_assumption ((temp___expr_424 us_rep)
  (temp___skip_top_level_425 Bool)) Bool (and
                                         (and
                                         (= (attr__tag temp___expr_424) 
                                         us_tag1)
                                         (and
                                         (= (rec__stacks__stack_root__content
                                            (us_split_fields1
                                            temp___expr_424)) (temp_____aggregate_def_200
                                                              0))
                                         (= (to_rep
                                            (rec__stacks__stack_root__length
                                            (us_split_fields1
                                            temp___expr_424))) 0)))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_425 true))
                                         (= (size temp___expr_424) 0))))

(declare-sort telement_arrayD1 0)

(declare-fun telement_arrayD1qtint (telement_arrayD1) Int)

;; telement_arrayD1'axiom
  (assert
  (forall ((i telement_arrayD1))
  (and (<= 1 (telement_arrayD1qtint i)) (<= (telement_arrayD1qtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq8 (telement_arrayD1 telement_arrayD1) Bool)

(declare-const dummy8 telement_arrayD1)

(declare-datatypes ()
((telement_arrayD1__ref
 (telement_arrayD1__refqtmk (telement_arrayD1__content telement_arrayD1)))))
(define-fun telement_arrayD1__ref_telement_arrayD1__content__projection ((a telement_arrayD1__ref)) telement_arrayD1 
  (telement_arrayD1__content a))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last2 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep2 (first2 (mk1 f l))) f)
     (= (to_rep2 (last2 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ()
((us_t1 (us_tqtmk1 (elts1 (Array Int element))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int element) (elts1 a))

(define-fun of_array1 ((a (Array Int element)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep2 (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep2 (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const component__size2 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment4))

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq (elts1 x) (to_rep2 (first2 (rt1 x)))
                  (to_rep2 (last2 (rt1 x))) (elts1 y)
                  (to_rep2 (first2 (rt1 y))) (to_rep2 (last2 (rt1 y)))))

(declare-fun user_eq9 (us_t1 us_t1) Bool)

(declare-const dummy9 us_t1)

(declare-datatypes ()
((telement_arrayB__ref
 (telement_arrayB__refqtmk (telement_arrayB__content us_t1)))))
(define-fun telement_arrayB__ref_telement_arrayB__content__projection ((a telement_arrayB__ref)) us_t1 
  (telement_arrayB__content a))

(declare-datatypes () ((t42s__ref (t42s__refqtmk (t42s__content us_t1)))))
(define-fun t42s__ref_t42s__content__projection ((a t42s__ref)) us_t1 
  (t42s__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 100)) (in_range1 temp___expr_172)))

(define-fun dynamic_invariant3 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_179)))

(define-fun dynamic_invariant4 ((temp___expr_210 us_t)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (not (= temp___skip_constant_207 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_210)
                                     (last1 temp___expr_210))))

;; temp___result_205'def
  (assert
  (forall ((temp___204 us_rep)) (size__function_guard (size temp___204)
  temp___204)))

(define-fun default_initial_assumption1 ((temp___expr_198 us_rep)
  (temp___skip_top_level_199 Bool)) Bool (and
                                         (and
                                         (= (attr__tag temp___expr_198) 
                                         us_tag)
                                         (and
                                         (= (rec__stacks__stack_root__content
                                            (us_split_fields1
                                            temp___expr_198)) (temp_____aggregate_def_200
                                                              0))
                                         (= (to_rep
                                            (rec__stacks__stack_root__length
                                            (us_split_fields1
                                            temp___expr_198))) 0)))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_199 true))
                                         (= (size temp___expr_198) 0))))

;; size__post_axiom
  (assert
  (forall ((s1 us_rep))
  (! (let ((result (size s1)))
     (=> (size__function_guard result s1) (dynamic_invariant2 result true
     false true true))) :pattern ((size s1)) )))

;; size__def_axiom
  (assert
  (forall ((s1 us_rep))
  (! (= (size s1) (to_rep
                  (rec__stacks__stack_root__length (us_split_fields1 s1)))) :pattern (
  (size s1)) )))

(declare-const rliteral element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___202 Int))
  (=> (dynamic_invariant3 temp___202 true true true true)
  (forall ((temp___203 Int))
  (= (select (temp_____aggregate_def_200 temp___202) temp___203) rliteral)))))

;; Assume
  (assert true)

(declare-const temp___913 Int)

;; Ensures
  (assert
  (= (to_rep (rec__stacks__stack_root__length (us_split_fields1 s))) 
  temp___913))

;; Assert
  (assert
  (=> (<= 1 temp___913)
  (and (and (<= 1 1) (<= 1 100)) (and (<= 1 temp___913) (<= temp___913 100)))))

(define-fun temp___915 () us_t1 (of_array1
                                (rec__stacks__stack_root__content
                                (us_split_fields1 s)) 1 temp___913))

(assert
;; defqtvc
 ;; File "stacks.ads", line 40, characters 0-0
  (not (dynamic_property 1 2147483647 (first3 temp___915)
  (last3 temp___915))))
(check-sat)