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

(declare-sort less_than_max 0)

(declare-fun less_than_maxqtint (less_than_max) Int)

;; less_than_max'axiom
  (assert
  (forall ((i less_than_max))
  (and (<= 0 (less_than_maxqtint i)) (<= (less_than_maxqtint i) 100))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (less_than_max less_than_max) Bool)

(declare-const dummy less_than_max)

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
  (forall ((x less_than_max)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort element 0)

(declare-fun elementqtint (element) Int)

;; element'axiom
  (assert
  (forall ((i element))
  (and (<= 0 (elementqtint i)) (<= (elementqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (element element) Bool)

(declare-const dummy1 element)

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
  (forall ((x element)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
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

(declare-const dummy2 (Array Int element))

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

(declare-fun user_eq2 ((Array Int element) (Array Int element)) Bool)

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

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((stack_root__ref 0))
(((stack_root__refqtmk (stack_root__content us_rep)))))
(define-fun stack_root__ref_stack_root__content__projection ((a stack_root__ref)) us_rep 
  (stack_root__content a))

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

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

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((stack__ref 0))
(((stack__refqtmk (stack__content us_rep)))))
(define-fun stack__ref_stack__content__projection ((a stack__ref)) us_rep 
  (stack__content a))

(declare-const s__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun size (us_rep) Int)

(declare-fun size__function_guard (Int us_rep) Bool)

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

(define-fun dynamic_invariant ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 100)) (in_range temp___expr_172)))

(define-fun dynamic_invariant1 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_179)))

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
  (forall ((s us_rep))
  (! (let ((result (size s)))
     (=> (size__function_guard result s) (dynamic_invariant result true false
     true true))) :pattern ((size s)) )))

;; size__def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (size s) (to_rep
                 (rec__stacks__stack_root__length (us_split_fields1 s)))) :pattern (
  (size s)) )))

;; is_empty__post_axiom
  (assert true)

;; is_empty__def_axiom
  (assert
  (forall ((s us_rep))
  (! (and (forall ((s1 us_rep)) (size__function_guard (size s1) s1))
     (= (= (is_empty s) true) (= (size s) 0))) :pattern ((is_empty s)) )))

(declare-const rliteral element)

;; rliteral_axiom
  (assert (= (elementqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___202 Int))
  (=> (dynamic_invariant1 temp___202 true true true true)
  (forall ((temp___203 Int))
  (= (select (temp_____aggregate_def_200 temp___202) temp___203) rliteral)))))

(declare-const rliteral1 less_than_max)

;; rliteral_axiom
  (assert (= (less_than_maxqtint rliteral1) 0))

(assert
;; defqtvc
 ;; File "stacks.ads", line 44, characters 0-0
  (not
  (forall ((s__split_fields us_split_fields)
  (s__split_fields1 us_split_fields))
  (=>
  (= s__split_fields1 (us_split_fieldsqtmk
                      (rec__stacks__stack_root__content s__split_fields)
                      rliteral1 (rec__ext__ s__split_fields)))
  (=>
  (forall ((s__split_fields2 us_split_fields)) (is_empty__function_guard
  (is_empty (us_repqtmk s__split_fields2 s__attr__tag))
  (us_repqtmk s__split_fields2 s__attr__tag)))
  (= (is_empty (us_repqtmk s__split_fields1 s__attr__tag)) true))))))
(check-sat)
(exit)
