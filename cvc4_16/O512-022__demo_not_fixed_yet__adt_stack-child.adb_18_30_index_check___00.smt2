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

(declare-const dummy1 (Array Int integer))

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

(declare-fun user_eq1 ((Array Int integer) (Array Int integer)) Bool)

(declare-sort stack_range 0)

(declare-fun stack_rangeqtint (stack_range) Int)

;; stack_range'axiom
  (assert
  (forall ((i stack_range))
  (and (<= 0 (stack_rangeqtint i)) (<= (stack_rangeqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (stack_range stack_range) Bool)

(declare-const dummy2 stack_range)

(declare-datatypes ((stack_range__ref 0))
(((stack_range__refqtmk (stack_range__content stack_range)))))
(define-fun stack_range__ref_stack_range__content__projection ((a stack_range__ref)) stack_range 
  (stack_range__content a))

(define-fun to_rep1 ((x stack_range)) Int (stack_rangeqtint x))

(declare-fun of_rep1 (Int) stack_range)

;; inversion_axiom
  (assert
  (forall ((x stack_range))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x stack_range)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__adt_stack__stack__stack_vector (Array Int integer))(rec__adt_stack__stack__stack_top stack_range)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__adt_stack__stack__stack_vector__projection ((a us_split_fields)) (Array Int integer) 
  (rec__adt_stack__stack__stack_vector a))

(define-fun us_split_fields_rec__adt_stack__stack__stack_top__projection ((a us_split_fields)) stack_range 
  (rec__adt_stack__stack__stack_top a))

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
                           (rec__adt_stack__stack__stack_vector
                           (us_split_fields1 a)) 1 100
                           (rec__adt_stack__stack__stack_vector
                           (us_split_fields1 b)) 1 100) true)
                        (= (to_rep1
                           (rec__adt_stack__stack__stack_top
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__adt_stack__stack__stack_top
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

(declare-const adt_stack__stack__stack_vector__first__bit Int)

(declare-const adt_stack__stack__stack_vector__last__bit Int)

(declare-const adt_stack__stack__stack_vector__position Int)

;; adt_stack__stack__stack_vector__first__bit_axiom
  (assert (<= 0 adt_stack__stack__stack_vector__first__bit))

;; adt_stack__stack__stack_vector__last__bit_axiom
  (assert
  (< adt_stack__stack__stack_vector__first__bit adt_stack__stack__stack_vector__last__bit))

;; adt_stack__stack__stack_vector__position_axiom
  (assert (<= 0 adt_stack__stack__stack_vector__position))

(declare-const adt_stack__stack__stack_top__first__bit Int)

(declare-const adt_stack__stack__stack_top__last__bit Int)

(declare-const adt_stack__stack__stack_top__position Int)

;; adt_stack__stack__stack_top__first__bit_axiom
  (assert (<= 0 adt_stack__stack__stack_top__first__bit))

;; adt_stack__stack__stack_top__last__bit_axiom
  (assert
  (< adt_stack__stack__stack_top__first__bit adt_stack__stack__stack_top__last__bit))

;; adt_stack__stack__stack_top__position_axiom
  (assert (<= 0 adt_stack__stack__stack_top__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((stack__ref 0))
(((stack__refqtmk (stack__content us_rep)))))
(define-fun stack__ref_stack__content__projection ((a stack__ref)) us_rep 
  (stack__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__ada___adt_stack__child__child_stack__child_stack_vector (Array Int integer))(rec__ada___adt_stack__child__child_stack__next_value integer)(rec__adt_stack__stack__stack_vector1 (Array Int integer))(rec__adt_stack__stack__stack_top1 stack_range)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__ada___adt_stack__child__child_stack__child_stack_vector__projection ((a us_split_fields2)) (Array Int integer) 
  (rec__ada___adt_stack__child__child_stack__child_stack_vector a))

(define-fun us_split_fields_rec__ada___adt_stack__child__child_stack__next_value__projection ((a us_split_fields2)) integer 
  (rec__ada___adt_stack__child__child_stack__next_value a))

(define-fun us_split_fields_rec__adt_stack__stack__stack_vector__2__projection ((a us_split_fields2)) (Array Int integer) 
  (rec__adt_stack__stack__stack_vector1 a))

(define-fun us_split_fields_rec__adt_stack__stack__stack_top__2__projection ((a us_split_fields2)) stack_range 
  (rec__adt_stack__stack__stack_top1 a))

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

(declare-fun hide_ext__ ((Array Int integer) integer us_private) us_private)

(declare-fun extract__ada___adt_stack__child__child_stack__child_stack_vector (us_private) (Array Int integer))

;; extract__ada___adt_stack__child__child_stack__child_stack_vector__conv
  (assert
  (forall
  ((ada___adt_stack__child__child_stack__child_stack_vector (Array Int integer)))
  (forall ((ada___adt_stack__child__child_stack__next_value integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__ada___adt_stack__child__child_stack__child_stack_vector
     (hide_ext__ ada___adt_stack__child__child_stack__child_stack_vector
     ada___adt_stack__child__child_stack__next_value rec__ext__2)) ada___adt_stack__child__child_stack__child_stack_vector)))))

(declare-fun extract__ada___adt_stack__child__child_stack__next_value (us_private) integer)

;; extract__ada___adt_stack__child__child_stack__next_value__conv
  (assert
  (forall
  ((ada___adt_stack__child__child_stack__child_stack_vector (Array Int integer)))
  (forall ((ada___adt_stack__child__child_stack__next_value integer))
  (forall ((rec__ext__2 us_private))
  (= (extract__ada___adt_stack__child__child_stack__next_value
     (hide_ext__ ada___adt_stack__child__child_stack__child_stack_vector
     ada___adt_stack__child__child_stack__next_value rec__ext__2)) ada___adt_stack__child__child_stack__next_value)))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__adt_stack__stack__stack_vector1
                                         (us_split_fields3 a))
                                         (rec__adt_stack__stack__stack_top1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__ada___adt_stack__child__child_stack__child_stack_vector
                                         (us_split_fields3 a))
                                         (rec__ada___adt_stack__child__child_stack__next_value
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__ada___adt_stack__child__child_stack__child_stack_vector
                                         (rec__ext__ (us_split_fields1 r)))
                                         (extract__ada___adt_stack__child__child_stack__next_value
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__adt_stack__stack__stack_vector
                                         (us_split_fields1 r))
                                         (rec__adt_stack__stack__stack_top
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (bool_eq
                            (rec__ada___adt_stack__child__child_stack__child_stack_vector
                            (us_split_fields3 a)) 1 100
                            (rec__ada___adt_stack__child__child_stack__child_stack_vector
                            (us_split_fields3 b)) 1 100) true)
                         (= (to_rep
                            (rec__ada___adt_stack__child__child_stack__next_value
                            (us_split_fields3 a))) (to_rep
                                                   (rec__ada___adt_stack__child__child_stack__next_value
                                                   (us_split_fields3 b)))))
                         (and
                         (= (bool_eq
                            (rec__adt_stack__stack__stack_vector1
                            (us_split_fields3 a)) 1 100
                            (rec__adt_stack__stack__stack_vector1
                            (us_split_fields3 b)) 1 100) true)
                         (= (to_rep1
                            (rec__adt_stack__stack__stack_top1
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__adt_stack__stack__stack_top1
                                                   (us_split_fields3 b))))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const ada___adt_stack__child__child_stack__child_stack_vector__first__bit Int)

(declare-const ada___adt_stack__child__child_stack__child_stack_vector__last__bit Int)

(declare-const ada___adt_stack__child__child_stack__child_stack_vector__position Int)

;; ada___adt_stack__child__child_stack__child_stack_vector__first__bit_axiom
  (assert
  (<= 0 ada___adt_stack__child__child_stack__child_stack_vector__first__bit))

;; ada___adt_stack__child__child_stack__child_stack_vector__last__bit_axiom
  (assert
  (< ada___adt_stack__child__child_stack__child_stack_vector__first__bit 
  ada___adt_stack__child__child_stack__child_stack_vector__last__bit))

;; ada___adt_stack__child__child_stack__child_stack_vector__position_axiom
  (assert
  (<= 0 ada___adt_stack__child__child_stack__child_stack_vector__position))

(declare-const ada___adt_stack__child__child_stack__next_value__first__bit Int)

(declare-const ada___adt_stack__child__child_stack__next_value__last__bit Int)

(declare-const ada___adt_stack__child__child_stack__next_value__position Int)

;; ada___adt_stack__child__child_stack__next_value__first__bit_axiom
  (assert (<= 0 ada___adt_stack__child__child_stack__next_value__first__bit))

;; ada___adt_stack__child__child_stack__next_value__last__bit_axiom
  (assert
  (< ada___adt_stack__child__child_stack__next_value__first__bit ada___adt_stack__child__child_stack__next_value__last__bit))

;; ada___adt_stack__child__child_stack__next_value__position_axiom
  (assert (<= 0 ada___adt_stack__child__child_stack__next_value__position))

(declare-const adt_stack__stack__stack_vector__first__bit1 Int)

(declare-const adt_stack__stack__stack_vector__last__bit1 Int)

(declare-const adt_stack__stack__stack_vector__position1 Int)

;; adt_stack__stack__stack_vector__first__bit_axiom
  (assert (<= 0 adt_stack__stack__stack_vector__first__bit1))

;; adt_stack__stack__stack_vector__last__bit_axiom
  (assert
  (< adt_stack__stack__stack_vector__first__bit1 adt_stack__stack__stack_vector__last__bit1))

;; adt_stack__stack__stack_vector__position_axiom
  (assert (<= 0 adt_stack__stack__stack_vector__position1))

(declare-const adt_stack__stack__stack_top__first__bit1 Int)

(declare-const adt_stack__stack__stack_top__last__bit1 Int)

(declare-const adt_stack__stack__stack_top__position1 Int)

;; adt_stack__stack__stack_top__first__bit_axiom
  (assert (<= 0 adt_stack__stack__stack_top__first__bit1))

;; adt_stack__stack__stack_top__last__bit_axiom
  (assert
  (< adt_stack__stack__stack_top__first__bit1 adt_stack__stack__stack_top__last__bit1))

;; adt_stack__stack__stack_top__position_axiom
  (assert (<= 0 adt_stack__stack__stack_top__position1))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((child_stack__ref 0))
(((child_stack__refqtmk (child_stack__content us_rep1)))))
(define-fun child_stack__ref_child_stack__content__projection ((a child_stack__ref)) us_rep1 
  (child_stack__content a))

(define-fun default_initial_assumption ((temp___expr_195 us_rep1)
  (temp___skip_top_level_196 Bool)) Bool (= (attr__tag1 temp___expr_195) 
  us_tag1))

(declare-const s__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption1 ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (= (attr__tag temp___expr_182) 
  us_tag))

(declare-fun push__specific_post (Int us_split_fields Int Int
  us_split_fields) Bool)

;; ada___adt_stack__child__child_stack__compat_axiom
  (assert true)

;; adt_stack__stack__compat_axiom
  (assert true)

(declare-sort tvectorD1 0)

(declare-fun tvectorD1qtint (tvectorD1) Int)

;; tvectorD1'axiom
  (assert
  (forall ((i tvectorD1))
  (and (<= 1 (tvectorD1qtint i)) (<= (tvectorD1qtint i) 100))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq5 (tvectorD1 tvectorD1) Bool)

(declare-const dummy5 tvectorD1)

(declare-datatypes ((tvectorD1__ref 0))
(((tvectorD1__refqtmk (tvectorD1__content tvectorD1)))))
(define-fun tvectorD1__ref_tvectorD1__content__projection ((a tvectorD1__ref)) tvectorD1 
  (tvectorD1__content a))

(define-fun dynamic_invariant1 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= 0 100)) (in_range1 temp___expr_173)))

(assert
;; defqtvc
 ;; File "adt_stack-child.ads", line 8, characters 0-0
  (not
  (forall ((s__split_fields us_split_fields2))
  (=> (dynamic_invariant x true false true true)
  (forall ((adt_stack__push__s__fields us_split_fields))
  (forall ((s__split_fields1 us_split_fields2))
  (=>
  (= s__split_fields1 (us_split_fields3
                      (of_base
                      (us_repqtmk adt_stack__push__s__fields
                      (attr__tag
                      (to_base (us_repqtmk1 s__split_fields s__attr__tag)))))))
  (forall ((o Int))
  (=>
  (= (to_rep
     (rec__ada___adt_stack__child__child_stack__next_value s__split_fields1)) o)
  (forall ((o1 integer))
  (=> (= (to_rep o1) o)
  (forall ((temp___264 Int))
  (=>
  (= (to_rep1 (rec__adt_stack__stack__stack_top1 s__split_fields1)) temp___264)
  (<= 1 temp___264))))))))))))))
(check-sat)
(exit)
