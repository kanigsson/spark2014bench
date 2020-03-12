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

(declare-fun size (Int) Int)

(declare-fun size__function_guard (Int Int) Bool)

(declare-fun size1 (Int) Int)

(declare-fun size__function_guard1 (Int Int) Bool)

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

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 0 (index_typeqtint i)) (<= (index_typeqtint i) 128))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 128)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index_type index_type) Bool)

(declare-const dummy1 index_type)

(declare-datatypes ()
((index_type__ref (index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 0 128)) (in_range2 temp___expr_180)))

;; size__post_axiom
  (assert
  (forall ((list_handler__integer_list__count Int))
  (! (=> (dynamic_invariant1 list_handler__integer_list__count true true true
     true)
     (let ((result (size list_handler__integer_list__count)))
     (=> (size__function_guard result list_handler__integer_list__count)
     (dynamic_invariant result true false true true)))) :pattern ((size
                                                                  list_handler__integer_list__count)) )))

;; size__post_refine_axiom
  (assert
  (forall ((list_handler__integer_list__count Int))
  (! (=> (dynamic_invariant1 list_handler__integer_list__count true true true
     true)
     (let ((result (size1 list_handler__integer_list__count)))
     (=> (size__function_guard1 result list_handler__integer_list__count)
     (and (= result list_handler__integer_list__count) (dynamic_invariant
     result true false true true))))) :pattern ((size1
                                                list_handler__integer_list__count)) )))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (element_type element_type) Bool)

(declare-const dummy2 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun to_rep ((x element_type)) Int (element_typeqtint x))

(declare-fun of_rep (Int) element_type)

;; inversion_axiom
  (assert
  (forall ((x element_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x element_type)) (! (in_range3
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x index_type)) Int (index_typeqtint x))

(declare-fun of_rep1 (Int) index_type)

;; inversion_axiom
  (assert
  (forall ((x index_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x index_type)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__list_handler__integer_list__list_node__value element_type)(rec__list_handler__integer_list__list_node__next index_type)(rec__list_handler__integer_list__list_node__previous index_type)))))
(define-fun us_split_fields_rec__list_handler__integer_list__list_node__value__projection ((a us_split_fields)) element_type 
  (rec__list_handler__integer_list__list_node__value a))

(define-fun us_split_fields_rec__list_handler__integer_list__list_node__next__projection ((a us_split_fields)) index_type 
  (rec__list_handler__integer_list__list_node__next a))

(define-fun us_split_fields_rec__list_handler__integer_list__list_node__previous__projection ((a us_split_fields)) index_type 
  (rec__list_handler__integer_list__list_node__previous a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__list_handler__integer_list__list_node__value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__list_handler__integer_list__list_node__value
                                                  (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__list_handler__integer_list__list_node__next
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__list_handler__integer_list__list_node__next
                                                  (us_split_fields1 b)))))
                        (= (to_rep1
                           (rec__list_handler__integer_list__list_node__previous
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__list_handler__integer_list__list_node__previous
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const list_handler__integer_list__list_node__value__first__bit Int)

(declare-const list_handler__integer_list__list_node__value__last__bit Int)

(declare-const list_handler__integer_list__list_node__value__position Int)

;; list_handler__integer_list__list_node__value__first__bit_axiom
  (assert (<= 0 list_handler__integer_list__list_node__value__first__bit))

;; list_handler__integer_list__list_node__value__last__bit_axiom
  (assert
  (< list_handler__integer_list__list_node__value__first__bit list_handler__integer_list__list_node__value__last__bit))

;; list_handler__integer_list__list_node__value__position_axiom
  (assert (<= 0 list_handler__integer_list__list_node__value__position))

(declare-const list_handler__integer_list__list_node__next__first__bit Int)

(declare-const list_handler__integer_list__list_node__next__last__bit Int)

(declare-const list_handler__integer_list__list_node__next__position Int)

;; list_handler__integer_list__list_node__next__first__bit_axiom
  (assert (<= 0 list_handler__integer_list__list_node__next__first__bit))

;; list_handler__integer_list__list_node__next__last__bit_axiom
  (assert
  (< list_handler__integer_list__list_node__next__first__bit list_handler__integer_list__list_node__next__last__bit))

;; list_handler__integer_list__list_node__next__position_axiom
  (assert (<= 0 list_handler__integer_list__list_node__next__position))

(declare-const list_handler__integer_list__list_node__previous__first__bit Int)

(declare-const list_handler__integer_list__list_node__previous__last__bit Int)

(declare-const list_handler__integer_list__list_node__previous__position Int)

;; list_handler__integer_list__list_node__previous__first__bit_axiom
  (assert (<= 0 list_handler__integer_list__list_node__previous__first__bit))

;; list_handler__integer_list__list_node__previous__last__bit_axiom
  (assert
  (< list_handler__integer_list__list_node__previous__first__bit list_handler__integer_list__list_node__previous__last__bit))

;; list_handler__integer_list__list_node__previous__position_axiom
  (assert (<= 0 list_handler__integer_list__list_node__previous__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((list_node__ref (list_node__refqtmk (list_node__content us_rep)))))
(define-fun list_node__ref_list_node__content__projection ((a list_node__ref)) us_rep 
  (list_node__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (bool_eq (select a temp___idx_156)
                              (select b (+ (- b__first a__first) temp___idx_156))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (bool_eq (select a temp___idx_156)
     (select b (+ (- b__first a__first) temp___idx_156))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int index_type))))))
(declare-fun slide1 ((Array Int index_type) Int Int) (Array Int index_type))

;; slide_eq
  (assert
  (forall ((a (Array Int index_type)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int index_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int index_type)) (a__first Int) (a__last Int)
  (b (Array Int index_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_157 Int))
                           (=>
                           (and (<= a__first temp___idx_157)
                           (<= temp___idx_157 a__last))
                           (= (to_rep1 (select a temp___idx_157)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_157)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int index_type)) (b (Array Int index_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_157 Int))
  (=> (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (= (to_rep1 (select a temp___idx_157)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_157)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun temp_____aggregate_def_250 (us_rep) (Array Int us_rep))

(declare-fun temp_____aggregate_def_254 (Int) (Array Int index_type))

(define-fun dynamic_invariant2 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_166)))

;; def_axiom
  (assert
  (forall ((temp___252 us_rep))
  (forall ((temp___253 Int))
  (= (select (temp_____aggregate_def_250 temp___252) temp___253) temp___252))))

(declare-const rliteral index_type)

;; rliteral_axiom
  (assert (= (index_typeqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___256 Int))
  (=> (dynamic_invariant1 temp___256 true true true true)
  (forall ((temp___257 Int))
  (= (select (temp_____aggregate_def_254 temp___256) temp___257) rliteral)))))

(declare-const count Int)

(declare-const memory (Array Int us_rep))

(declare-const free_list (Array Int index_type))

(declare-const free Int)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 count false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 free false false true true))

(declare-const count1 Int)

;; H
  (assert (= count1 0))

(declare-const free_list1 (Array Int index_type))

;; H
  (assert (= free_list1 (temp_____aggregate_def_254 0)))

(declare-const index Int)

;; H
  (assert (= index 1))

;; H
  (assert
  (or
  (not
  (= (and (ite (<= 1 index) true false) (ite (<= index 127) true false)) true))
  (exists ((free_list2 (Array Int index_type)) (index1 Int))
  (and
  (= (and (ite (forall ((temp___261 Int))
               (=> (and (<= 0 temp___261) (<= temp___261 128))
               (=>
               (or (< 127 temp___261)
               (or (< temp___261 1) (<= index1 temp___261)))
               (= (select free_list2 temp___261) (select free_list1 temp___261)))))
          true false) (ite (and (<= 1 index1) (<= index1 127)) true false)) true)
  (exists ((o index_type)) (and (= (to_rep1 o) (+ index1 1)) (= index1 127)))))))

(assert
;; defqtvc
 ;; File "double_list.ads", line 14, characters 0-0
  (not (= count1 0)))
(check-sat)
