;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (length_type length_type) Bool)

(declare-const dummy length_type)

(declare-datatypes ((length_type__ref 0))
(((length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(define-fun to_rep ((x length_type)) Int (length_typeqtint x))

(declare-fun of_rep (Int) length_type)

;; inversion_axiom
  (assert
  (forall ((x length_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x length_type)) (! (in_range1
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
  (and (<= 1 (elementqtint i)) (<= (elementqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

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
  (rec__stack__stack_model__top length_type)(rec__stack__stack_model__content (Array Int element))))))
(define-fun us_split_fields_rec__stack__stack_model__top__projection ((a us_split_fields)) length_type 
  (rec__stack__stack_model__top a))

(define-fun us_split_fields_rec__stack__stack_model__content__projection ((a us_split_fields)) (Array Int element) 
  (rec__stack__stack_model__content a))

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
                           (rec__stack__stack_model__top
                           (us_split_fields1 a))) (to_rep
                                                  (rec__stack__stack_model__top
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__stack__stack_model__content
                           (us_split_fields1 a)) 1 100
                           (rec__stack__stack_model__content
                           (us_split_fields1 b)) 1 100) true))
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

(declare-const stack__stack_model__top__first__bit Int)

(declare-const stack__stack_model__top__last__bit Int)

(declare-const stack__stack_model__top__position Int)

;; stack__stack_model__top__first__bit_axiom
  (assert (<= 0 stack__stack_model__top__first__bit))

;; stack__stack_model__top__last__bit_axiom
  (assert
  (< stack__stack_model__top__first__bit stack__stack_model__top__last__bit))

;; stack__stack_model__top__position_axiom
  (assert (<= 0 stack__stack_model__top__position))

(declare-const stack__stack_model__content__first__bit Int)

(declare-const stack__stack_model__content__last__bit Int)

(declare-const stack__stack_model__content__position Int)

;; stack__stack_model__content__first__bit_axiom
  (assert (<= 0 stack__stack_model__content__first__bit))

;; stack__stack_model__content__last__bit_axiom
  (assert
  (< stack__stack_model__content__first__bit stack__stack_model__content__last__bit))

;; stack__stack_model__content__position_axiom
  (assert (<= 0 stack__stack_model__content__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((stack_model__ref 0))
(((stack_model__refqtmk (stack_model__content us_rep)))))
(define-fun stack_model__ref_stack_model__content__projection ((a stack_model__ref)) us_rep 
  (stack_model__content a))

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun is_empty2 (Int) Bool)

(declare-fun is_empty2__function_guard (Bool Int) Bool)

(define-fun dynamic_invariant ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 0 100)) (in_range1 temp___expr_180)))

;; is_empty2__post_axiom
  (assert true)

;; is_empty2__def_axiom
  (assert
  (forall ((stack__p_top Int))
  (! (= (= (is_empty2 stack__p_top) true) (= stack__p_top 0)) :pattern (
  (is_empty2 stack__p_top)) )))

(declare-fun is_full2 (Int) Bool)

(declare-fun is_full2__function_guard (Bool Int) Bool)

;; is_full2__post_axiom
  (assert true)

;; is_full2__def_axiom
  (assert
  (forall ((stack__p_top Int))
  (! (= (= (is_full2 stack__p_top) true) (<= 100 stack__p_top)) :pattern (
  (is_full2 stack__p_top)) )))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun get_stack2 (Int (Array Int element)) us_rep)

(declare-fun get_stack2__function_guard (us_rep Int
  (Array Int element)) Bool)

;; get_stack2__post_axiom
  (assert true)

;; get_stack2__def_axiom
  (assert
  (forall ((stack__p_top Int))
  (forall ((stack__p_content (Array Int element)))
  (! (=> (dynamic_invariant stack__p_top true true true true)
     (= (get_stack2 stack__p_top stack__p_content) (us_repqtmk
                                                   (us_split_fieldsqtmk
                                                   (of_rep stack__p_top)
                                                   stack__p_content)))) :pattern (
  (get_stack2 stack__p_top stack__p_content)) ))))

(declare-fun peek2 (Int (Array Int element)) Int)

(declare-fun peek2__function_guard (Int Int (Array Int element)) Bool)

(define-fun dynamic_invariant1 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 1 2147483647)) (in_range2
                                     temp___expr_167)))

;; peek2__post_axiom
  (assert
  (forall ((stack__p_top Int))
  (forall ((stack__p_content (Array Int element)))
  (! (and
     (forall ((stack__p_top1 Int)) (is_empty2__function_guard
     (is_empty2 stack__p_top1) stack__p_top1))
     (=>
     (and (dynamic_invariant stack__p_top true true true true)
     (not (= (is_empty2 stack__p_top) true)))
     (let ((result (peek2 stack__p_top stack__p_content)))
     (=> (peek2__function_guard result stack__p_top stack__p_content)
     (dynamic_invariant1 result true false true true))))) :pattern ((peek2
                                                                    stack__p_top
                                                                    stack__p_content)) ))))

;; peek2__def_axiom
  (assert
  (forall ((stack__p_top Int))
  (forall ((stack__p_content (Array Int element)))
  (! (=> (dynamic_invariant stack__p_top true true true true)
     (= (peek2 stack__p_top stack__p_content) (to_rep1
                                              (select stack__p_content stack__p_top)))) :pattern (
  (peek2 stack__p_top stack__p_content)) ))))

(declare-sort tTp_contentSP1 0)

(declare-fun tTp_contentSP1qtint (tTp_contentSP1) Int)

;; tTp_contentSP1'axiom
  (assert
  (forall ((i tTp_contentSP1))
  (and (<= 1 (tTp_contentSP1qtint i)) (<= (tTp_contentSP1qtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (tTp_contentSP1 tTp_contentSP1) Bool)

(declare-const dummy4 tTp_contentSP1)

(declare-datatypes ((tTp_contentSP1__ref 0))
(((tTp_contentSP1__refqtmk (tTp_contentSP1__content tTp_contentSP1)))))
(define-fun tTp_contentSP1__ref_tTp_contentSP1__content__projection ((a tTp_contentSP1__ref)) tTp_contentSP1 
  (tTp_contentSP1__content a))

(assert
;; defqtvc
 ;; File "stack.ads", line 38, characters 0-0
  (not
  (forall ((p_top Int) (p_content (Array Int element)))
  (=> (dynamic_invariant1 e true false true true)
  (=> (dynamic_invariant p_top true false true true)
  (=>
  (forall ((p_top1 Int)) (is_full2__function_guard (is_full2 p_top1) p_top1))
  (forall ((p_top1 Int) (p_content1 (Array Int element)))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (<= 100 p_top) true false))
  (ite (= spark__branch true) (and (= p_top1 p_top) (= p_content1 p_content))
  (let ((o (+ p_top 1)))
  (and (in_range1 o)
  (and (= p_top1 o)
  (exists ((o1 element))
  (and (= (to_rep1 o1) e)
  (and (and (<= 1 p_top1) (<= p_top1 100))
  (= p_content1 (store p_content p_top1 o1)))))))))))
  (=> (not (= (is_full2 p_top) true))
  (=>
  (forall ((p_top2 Int)) (is_empty2__function_guard (is_empty2 p_top2)
  p_top2)) (not (= (is_empty2 p_top1) true))))))))))))
(check-sat)