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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-datatypes ((less_than_max__ref 0))
(((less_than_max__refqtmk (less_than_max__content less_than_max)))))
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

(declare-datatypes ((element__ref 0))
(((element__refqtmk (element__content element)))))
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

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element))))))
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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__stacks__stack_root__content (Array Int element))(rec__stacks__stack_root__length less_than_max)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__stacks__stack_root__content__projection ((a us_split_fields)) (Array Int element) 
  (rec__stacks__stack_root__content a))

(define-fun us_split_fields_rec__stacks__stack_root__length__projection ((a us_split_fields)) less_than_max 
  (rec__stacks__stack_root__length a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
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

(declare-datatypes ((stack_root__ref 0))
(((stack_root__refqtmk (stack_root__content us_rep)))))
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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
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

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int element))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int element) (elts a))

(define-fun of_array ((a (Array Int element)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-datatypes ((model__ref 0))
(((model__refqtmk (model__content us_t)))))
(define-fun model__ref_model__content__projection ((a model__ref)) us_t 
  (model__content a))

(declare-sort positive_less_than_max 0)

(declare-fun positive_less_than_maxqtint (positive_less_than_max) Int)

;; positive_less_than_max'axiom
  (assert
  (forall ((i positive_less_than_max))
  (and (<= 1 (positive_less_than_maxqtint i))
  (<= (positive_less_than_maxqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (positive_less_than_max positive_less_than_max) Bool)

(declare-const dummy7 positive_less_than_max)

(declare-datatypes ((positive_less_than_max__ref 0))
(((positive_less_than_max__refqtmk
  (positive_less_than_max__content positive_less_than_max)))))
(define-fun positive_less_than_max__ref_positive_less_than_max__content__projection ((a positive_less_than_max__ref)) positive_less_than_max 
  (positive_less_than_max__content a))

(define-fun to_rep3 ((x positive_less_than_max)) Int (positive_less_than_maxqtint
                                                     x))

(declare-fun of_rep3 (Int) positive_less_than_max)

;; inversion_axiom
  (assert
  (forall ((x positive_less_than_max))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x positive_less_than_max)) (! (in_range4
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__stacks__buffer__first positive_less_than_max)(rec__stacks__stack_root__content1 (Array Int element))(rec__stacks__stack_root__length1 less_than_max)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__stacks__buffer__first__projection ((a us_split_fields2)) positive_less_than_max 
  (rec__stacks__buffer__first a))

(define-fun us_split_fields_rec__stacks__stack_root__content__2__projection ((a us_split_fields2)) (Array Int element) 
  (rec__stacks__stack_root__content1 a))

(define-fun us_split_fields_rec__stacks__stack_root__length__2__projection ((a us_split_fields2)) less_than_max 
  (rec__stacks__stack_root__length1 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (positive_less_than_max us_private) us_private)

(declare-fun extract__stacks__buffer__first (us_private) positive_less_than_max)

;; extract__stacks__buffer__first__conv
  (assert
  (forall ((stacks__buffer__first positive_less_than_max))
  (forall ((rec__ext__2 us_private))
  (= (extract__stacks__buffer__first
     (hide_ext__ stacks__buffer__first rec__ext__2)) stacks__buffer__first))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__stacks__stack_root__content1
                                         (us_split_fields3 a))
                                         (rec__stacks__stack_root__length1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__stacks__buffer__first
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__stacks__buffer__first
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__stacks__stack_root__content
                                         (us_split_fields1 r))
                                         (rec__stacks__stack_root__length
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep3
                            (rec__stacks__buffer__first (us_split_fields3 a))) 
                         (to_rep3
                         (rec__stacks__buffer__first (us_split_fields3 b))))
                         (= (bool_eq
                            (rec__stacks__stack_root__content1
                            (us_split_fields3 a)) 1 100
                            (rec__stacks__stack_root__content1
                            (us_split_fields3 b)) 1 100) true))
                         (= (to_rep
                            (rec__stacks__stack_root__length1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__stacks__stack_root__length1
                                                   (us_split_fields3 b)))))
                    true false))

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

(declare-const stacks__buffer__first__first__bit Int)

(declare-const stacks__buffer__first__last__bit Int)

(declare-const stacks__buffer__first__position Int)

;; stacks__buffer__first__first__bit_axiom
  (assert (<= 0 stacks__buffer__first__first__bit))

;; stacks__buffer__first__last__bit_axiom
  (assert
  (< stacks__buffer__first__first__bit stacks__buffer__first__last__bit))

;; stacks__buffer__first__position_axiom
  (assert (<= 0 stacks__buffer__first__position))

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

(declare-fun user_eq8 (us_rep1 us_rep1) Bool)

(declare-const dummy8 us_rep1)

(declare-datatypes ((buffer__ref 0))
(((buffer__refqtmk (buffer__content us_rep1)))))
(define-fun buffer__ref_buffer__content__projection ((a buffer__ref)) us_rep1 
  (buffer__content a))

(declare-fun temp_____aggregate_def_200 (Int) (Array Int element))

;; temp___result_618'def
  (assert
  (forall ((temp___617 us_rep1)) (size__function_guard
  (size (to_base temp___617)) (to_base temp___617))))

(define-fun default_initial_assumption ((temp___expr_615 us_rep1)
  (temp___skip_top_level_616 Bool)) Bool (and
                                         (and
                                         (= (attr__tag1 temp___expr_615) 
                                         us_tag1)
                                         (and
                                         (and
                                         (= (to_rep3
                                            (rec__stacks__buffer__first
                                            (us_split_fields3
                                            temp___expr_615))) 1)
                                         (= (rec__stacks__stack_root__content1
                                            (us_split_fields3
                                            temp___expr_615)) (temp_____aggregate_def_200
                                                              0)))
                                         (= (to_rep
                                            (rec__stacks__stack_root__length1
                                            (us_split_fields3
                                            temp___expr_615))) 0)))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_616 true))
                                         (= (size (to_base temp___expr_615)) 0))))

(declare-const s us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun in_range5 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Bool)

(declare-fun wraps_around (us_rep1) Bool)

(declare-fun wraps_around__function_guard (Bool us_rep1) Bool)

(declare-fun wraps_around1 (Int us_rep1) Bool)

(declare-fun wraps_around__function_guard1 (Bool Int us_rep1) Bool)

;; wraps_around__post_axiom
  (assert true)

;; wraps_around__post__dispatch_axiom
  (assert true)

;; stacks__buffer__compat_axiom
  (assert
  (forall ((s1 us_rep1))
  (! (=> (wraps_around__function_guard1 (wraps_around1 us_tag1 s1) us_tag1
     s1)
     (and
     (forall ((s2 us_rep1)) (wraps_around__function_guard (wraps_around s2)
     s2))
     (= (ite (wraps_around s1) 1 0) (ite (wraps_around1 us_tag1 s1) 1 0)))) :pattern (
  (wraps_around1 us_tag1 s1)) )))

;; wraps_around__def_axiom
  (assert
  (forall ((s1 us_rep1))
  (! (= (= (wraps_around s1) true)
     (< 100 (- (+ (to_rep3
                  (rec__stacks__buffer__first (us_split_fields3 s1))) 
     (to_rep (rec__stacks__stack_root__length1 (us_split_fields3 s1)))) 1))) :pattern (
  (wraps_around s1)) )))

(declare-fun last2 (us_rep1) Int)

(declare-fun last__function_guard (Int us_rep1) Bool)

(declare-fun last3 (Int us_rep1) Int)

(declare-fun last__function_guard1 (Int Int us_rep1) Bool)

(define-fun dynamic_invariant ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 100)) (in_range1 temp___expr_172)))

;; last__post_axiom
  (assert
  (forall ((s1 us_rep1))
  (! (let ((result (last2 s1)))
     (=> (last__function_guard result s1) (dynamic_invariant result true
     false true true))) :pattern ((last2 s1)) )))

;; last__post__dispatch_axiom
  (assert
  (forall ((attr__tag2 Int))
  (forall ((s1 us_rep1))
  (! (let ((result (last3 attr__tag2 s1)))
     (=> (last__function_guard1 result attr__tag2 s1) (dynamic_invariant
     result true false true true))) :pattern ((last3 attr__tag2 s1)) ))))

;; stacks__buffer__compat_axiom
  (assert
  (forall ((s1 us_rep1))
  (! (=> (last__function_guard1 (last3 us_tag1 s1) us_tag1 s1)
     (and (forall ((s2 us_rep1)) (last__function_guard (last2 s2) s2))
     (= (last2 s1) (last3 us_tag1 s1)))) :pattern ((last3 us_tag1 s1)) )))

;; last__def_axiom
  (assert
  (forall ((s1 us_rep1))
  (! (and
     (forall ((s2 us_rep1)) (wraps_around__function_guard (wraps_around s2)
     s2))
     (= (last2 s1) (ite (not (= (wraps_around s1) true))
                   (- (+ (to_rep3
                         (rec__stacks__buffer__first (us_split_fields3 s1))) 
                   (to_rep
                   (rec__stacks__stack_root__length1 (us_split_fields3 s1)))) 1)
                   (- (- (+ (to_rep3
                            (rec__stacks__buffer__first
                            (us_split_fields3 s1))) (to_rep
                                                    (rec__stacks__stack_root__length1
                                                    (us_split_fields3 s1)))) 1) 100)))) :pattern (
  (last2 s1)) )))

(declare-sort telement_arrayD1 0)

(declare-fun telement_arrayD1qtint (telement_arrayD1) Int)

;; telement_arrayD1'axiom
  (assert
  (forall ((i telement_arrayD1))
  (and (<= 1 (telement_arrayD1qtint i)) (<= (telement_arrayD1qtint i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (telement_arrayD1 telement_arrayD1) Bool)

(declare-const dummy9 telement_arrayD1)

(declare-datatypes ((telement_arrayD1__ref 0))
(((telement_arrayD1__refqtmk (telement_arrayD1__content telement_arrayD1)))))
(define-fun telement_arrayD1__ref_telement_arrayD1__content__projection ((a telement_arrayD1__ref)) telement_arrayD1 
  (telement_arrayD1__content a))

(declare-fun concat1 ((Array Int element) Int Int (Array Int element) Int
  Int) (Array Int element))

;; concat_def
  (assert
  (forall ((a (Array Int element)) (b (Array Int element)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (element Int (Array Int element) Int
  Int) (Array Int element))

;; concat_singleton_left_def
  (assert
  (forall ((a element))
  (forall ((b (Array Int element)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int element) Int Int
  element) (Array Int element))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int element)))
  (forall ((b element))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (element Int element) (Array Int element))

;; concat_singletons_def
  (assert
  (forall ((a element) (b element))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (element Int) (Array Int element))

;; singleton_def
  (assert
  (forall ((v element))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last4 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep2 (first2 (mk1 f l))) f)
     (= (to_rep2 (last4 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range6 low) (in_range6 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int element))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int element) (elts1 a))

(define-fun of_array1 ((a (Array Int element)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep2 (first2 (rt1 a))))

(define-fun last5 ((a us_t1)) Int (to_rep2 (last4 (rt1 a))))

(define-fun length2 ((a us_t1)) Int (ite (<= (first3 a) (last5 a))
                                    (+ (- (last5 a) (first3 a)) 1) 0))

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

(define-fun bool_eq4 ((x us_t1)
  (y us_t1)) Bool (bool_eq (elts1 x) (to_rep2 (first2 (rt1 x)))
                  (to_rep2 (last4 (rt1 x))) (elts1 y)
                  (to_rep2 (first2 (rt1 y))) (to_rep2 (last4 (rt1 y)))))

(declare-fun user_eq10 (us_t1 us_t1) Bool)

(declare-const dummy10 us_t1)

(declare-datatypes ((telement_arrayB__ref 0))
(((telement_arrayB__refqtmk (telement_arrayB__content us_t1)))))
(define-fun telement_arrayB__ref_telement_arrayB__content__projection ((a telement_arrayB__ref)) us_t1 
  (telement_arrayB__content a))

(declare-datatypes ((t70s__ref 0))
(((t70s__refqtmk (t70s__content us_t1)))))
(define-fun t70s__ref_t70s__content__projection ((a t70s__ref)) us_t1 
  (t70s__content a))

(declare-datatypes ((t73s__ref 0))
(((t73s__refqtmk (t73s__content us_t1)))))
(define-fun t73s__ref_t73s__content__projection ((a t73s__ref)) us_t1 
  (t73s__content a))

(declare-datatypes ((t76s__ref 0))
(((t76s__refqtmk (t76s__content us_t1)))))
(define-fun t76s__ref_t76s__content__projection ((a t76s__ref)) us_t1 
  (t76s__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

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
     (=> (size__function_guard result s1) (dynamic_invariant result true
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

(define-fun dynamic_invariant5 ((temp___expr_606 Int)
  (temp___is_init_602 Bool) (temp___skip_constant_603 Bool)
  (temp___do_toplevel_604 Bool)
  (temp___do_typ_inv_605 Bool)) Bool (=>
                                     (or (= temp___is_init_602 true)
                                     (<= 1 100)) (in_range4 temp___expr_606)))

(assert
;; defqtvc
 ;; File "stacks.ads", line 60, characters 0-0
  (not
  (let ((o s))
  (let ((o1 (wraps_around o)))
  (=>
  (and (wraps_around__function_guard o1 o)
  (= (= o1 true)
  (< 100 (- (+ (to_rep3 (rec__stacks__buffer__first (us_split_fields3 o))) 
  (to_rep (rec__stacks__stack_root__length1 (us_split_fields3 o)))) 1))))
  (=> (= o1 true)
  (let ((o2 s))
  (let ((stacks__get_model__3__R71s (last2 o2)))
  (=>
  (forall ((o3 us_rep1)) (wraps_around__function_guard (wraps_around o3) o3))
  (=>
  (and (last__function_guard stacks__get_model__3__R71s o2)
  (and (dynamic_invariant stacks__get_model__3__R71s true false true true)
  (= stacks__get_model__3__R71s (ite (not (= (wraps_around o2) true))
                                (- (+ (to_rep3
                                      (rec__stacks__buffer__first
                                      (us_split_fields3 o2))) (to_rep
                                                              (rec__stacks__stack_root__length1
                                                              (us_split_fields3
                                                              o2)))) 1)
                                (- (- (+ (to_rep3
                                         (rec__stacks__buffer__first
                                         (us_split_fields3 o2))) (to_rep
                                                                 (rec__stacks__stack_root__length1
                                                                 (us_split_fields3
                                                                 o2)))) 1) 100)))))
  (=>
  (=> (<= 1 stacks__get_model__3__R71s)
  (and (and (<= 1 1) (<= 1 100))
  (and (<= 1 stacks__get_model__3__R71s) (<= stacks__get_model__3__R71s 100))))
  (let ((temp___1016 (of_array1
                     (rec__stacks__stack_root__content1 (us_split_fields3 s))
                     1 stacks__get_model__3__R71s)))
  (forall ((temp___1010 Int))
  (=>
  (= (to_rep3 (rec__stacks__buffer__first (us_split_fields3 s))) temp___1010)
  (=>
  (=> (<= temp___1010 100)
  (and (and (<= 1 temp___1010) (<= temp___1010 100))
  (and (<= 1 100) (<= 100 100))))
  (let ((temp___1015 (of_array1
                     (rec__stacks__stack_root__content1 (us_split_fields3 s))
                     temp___1010 100)))
  (=> (not (= (length2 temp___1015) 0)) (in_range6
  (- (+ 1 (+ (length (first3 temp___1015) (last5 temp___1015)) (length
                                                               (first3
                                                               temp___1016)
                                                               (last5
                                                               temp___1016)))) 1)))))))))))))))))))
(check-sat)
(exit)
