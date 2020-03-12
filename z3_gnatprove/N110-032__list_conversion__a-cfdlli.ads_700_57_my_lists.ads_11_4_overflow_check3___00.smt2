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

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (count_type count_type) Bool)

(declare-const dummy count_type)

(declare-datatypes ()
((count_type__ref (count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__my_lists__my_lists__list__capacity count_type)))))
(define-fun us_split_discrs_rec__my_lists__my_lists__list__capacity__projection ((a us_split_discrs)) count_type 
  (rec__my_lists__my_lists__list__capacity a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__my_lists__my_lists__list us_main_type)))))
(define-fun us_split_fields_rec__my_lists__my_lists__list__projection ((a us_split_fields)) us_main_type 
  (rec__my_lists__my_lists__list a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__my_lists__my_lists__list__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__my_lists__my_lists__list__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__my_lists__my_lists__list
                           (us_split_fields1 a))
                           (rec__my_lists__my_lists__list
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range1 ((rec__my_lists__my_lists__list__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__my_lists__my_lists__list__capacity1 
  (to_rep (rec__my_lists__my_lists__list__capacity a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const my_lists__my_lists__list__capacity__first__bit Int)

(declare-const my_lists__my_lists__list__capacity__last__bit Int)

(declare-const my_lists__my_lists__list__capacity__position Int)

;; my_lists__my_lists__list__capacity__first__bit_axiom
  (assert (<= 0 my_lists__my_lists__list__capacity__first__bit))

;; my_lists__my_lists__list__capacity__last__bit_axiom
  (assert
  (< my_lists__my_lists__list__capacity__first__bit my_lists__my_lists__list__capacity__last__bit))

;; my_lists__my_lists__list__capacity__position_axiom
  (assert (<= 0 my_lists__my_lists__list__capacity__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((list__ref (list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq1 a b) (oeq a b)) :pattern ((user_eq1 a b)) )))

(define-fun dynamic_invariant ((temp___expr_243 Int)
  (temp___is_init_239 Bool) (temp___skip_constant_240 Bool)
  (temp___do_toplevel_241 Bool)
  (temp___do_typ_inv_242 Bool)) Bool (=>
                                     (or (= temp___is_init_239 true)
                                     (<= 0 2147483647)) (in_range
                                     temp___expr_243)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and
     (<= result (to_rep
                (rec__my_lists__my_lists__list__capacity
                (us_split_discrs1 container))))
     (dynamic_invariant result true false true true))) :pattern ((length
                                                                 container)) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((sequence__ref (sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-sort us_main_type2 0)

(declare-fun us_main_eq2 (us_main_type2 us_main_type2) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes () ((map__ref (map__refqtmk (map__content us_rep2)))))
(define-fun map__ref_map__content__projection ((a map__ref)) us_rep2 
  (map__content a))

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range2 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(define-fun last ((container us_rep1)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(declare-fun get (us_rep1 Int) Int)

(declare-fun get__function_guard (Int us_rep1 Int) Bool)

(define-fun oeq1 ((left us_rep1)
  (right us_rep1)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (get left
                                                                   n) 
                                                                (get right n))))
                                                                true false)))

(declare-fun oeq__function_guard1 (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq2 a b) (oeq1 a b)) :pattern ((user_eq2 a b)) )))

(define-fun default_initial_assumption ((temp___expr_294 us_rep1)
  (temp___skip_top_level_295 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_295 true))
                                         (= (length1 temp___expr_294) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

(declare-fun positions (us_rep) us_rep2)

(declare-fun positions__function_guard (us_rep2 us_rep) Bool)

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1 (rec__my_lists__my_lists__cursor__node count_type)))))
(define-fun us_split_fields_rec__my_lists__my_lists__cursor__node__projection ((a us_split_fields2)) count_type 
  (rec__my_lists__my_lists__cursor__node a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep3 (us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep3)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep3)
  (b us_rep3)) Bool (ite (= (to_rep
                            (rec__my_lists__my_lists__cursor__node
                            (us_split_fields3 a))) (to_rep
                                                   (rec__my_lists__my_lists__cursor__node
                                                   (us_split_fields3 b))))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const my_lists__my_lists__cursor__node__first__bit Int)

(declare-const my_lists__my_lists__cursor__node__last__bit Int)

(declare-const my_lists__my_lists__cursor__node__position Int)

;; my_lists__my_lists__cursor__node__first__bit_axiom
  (assert (<= 0 my_lists__my_lists__cursor__node__first__bit))

;; my_lists__my_lists__cursor__node__last__bit_axiom
  (assert
  (< my_lists__my_lists__cursor__node__first__bit my_lists__my_lists__cursor__node__last__bit))

;; my_lists__my_lists__cursor__node__position_axiom
  (assert (<= 0 my_lists__my_lists__cursor__node__position))

(declare-fun user_eq4 (us_rep3 us_rep3) Bool)

(declare-const dummy4 us_rep3)

(declare-datatypes ()
((cursor__ref (cursor__refqtmk (cursor__content us_rep3)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep3 
  (cursor__content a))

(declare-const no_element us_rep3)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((key_type__ref (key_type__refqtmk (key_type__content us_rep3)))))
(define-fun key_type__ref_key_type__content__projection ((a key_type__ref)) us_rep3 
  (key_type__content a))

(declare-fun has_key (us_rep2 us_rep3) Bool)

(declare-fun has_key__function_guard (Bool us_rep2 us_rep3) Bool)

(declare-fun get1 (us_rep2 us_rep3) Int)

(declare-fun get__function_guard1 (Int us_rep2 us_rep3) Bool)

(declare-fun length3 (us_rep2) Int)

(declare-fun length__function_guard2 (Int us_rep2) Bool)

(declare-fun oeq2 (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard2 (Bool us_rep2 us_rep2) Bool)

(declare-fun is_empty (us_rep2) Bool)

(declare-fun is_empty__function_guard (Bool us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq3 a b) (oeq2 a b)) :pattern ((user_eq3 a b)) )))

(define-fun default_initial_assumption1 ((temp___expr_316 us_rep2)
  (temp___skip_top_level_317 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_317 true))
                                         (and
                                         (= (is_empty temp___expr_316) true)
                                         (= (length3 temp___expr_316) 0))))

(define-fun default_initial_assumption2 ((temp___expr_302 us_rep3)
  (temp___skip_top_level_303 Bool)) Bool (= (to_rep
                                            (rec__my_lists__my_lists__cursor__node
                                            (us_split_fields3
                                            temp___expr_302))) 0))

;; positions__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (positions container)))
     (and (not (= (has_key result no_element) true))
     (forall ((i us_rep3))
     (=> (= (has_key result i) true)
     (and
     (let ((temp___368 (get1 result i)))
     (and (<= 1 temp___368) (<= temp___368 (length container))))
     (forall ((j us_rep3))
     (=> (= (has_key result j) true)
     (=> (= (get1 result i) (get1 result j)) (= (bool_eq3 i j) true))))))))) :pattern (
  (positions container)) )))

(declare-const container__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const new_item Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const count Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 0 (element_typeqtint i)) (<= (element_typeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq5 (element_type element_type) Bool)

(declare-const dummy5 element_type)

(declare-datatypes ()
((element_type__ref
 (element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_236 Int)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (or (= temp___is_init_232 true)
                                     (<= 0 100)) (in_range3 temp___expr_236)))

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq6 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy6 tcount_typeB)

(declare-datatypes ()
((tcount_typeB__ref
 (tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(define-fun default_initial_assumption3 ((temp___expr_257 us_rep3)
  (temp___skip_top_level_258 Bool)) Bool (= (to_rep
                                            (rec__my_lists__my_lists__cursor__node
                                            (us_split_fields3
                                            temp___expr_257))) 0))

(declare-const rliteral count_type)

;; rliteral_axiom
  (assert (= (count_typeqtint rliteral) 0))

;; no_element__def_axiom
  (assert (= no_element (us_repqtmk1 (us_split_fieldsqtmk1 rliteral))))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (extended_index extended_index) Bool)

(declare-const dummy7 extended_index)

(declare-datatypes ()
((extended_index__ref
 (extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant2 ((temp___expr_286 Int)
  (temp___is_init_282 Bool) (temp___skip_constant_283 Bool)
  (temp___do_toplevel_284 Bool)
  (temp___do_typ_inv_285 Bool)) Bool (=>
                                     (or (= temp___is_init_282 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_286)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant result true false
     true true))) :pattern ((length1 container)) )))

(declare-sort element_type1 0)

(declare-fun element_typeqtint1 (element_type1) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type1))
  (and (<= 0 (element_typeqtint1 i)) (<= (element_typeqtint1 i) 100))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (element_type1 element_type1) Bool)

(declare-const dummy8 element_type1)

(declare-datatypes ()
((element_type__ref1
 (element_type__refqtmk1 (element_type__content1 element_type1)))))
(define-fun element_type__ref_element_type__content__3__projection ((a element_type__ref1)) element_type1 
  (element_type__content1 a))

(define-fun dynamic_invariant3 ((temp___expr_279 Int)
  (temp___is_init_275 Bool) (temp___skip_constant_276 Bool)
  (temp___do_toplevel_277 Bool)
  (temp___do_typ_inv_278 Bool)) Bool (=>
                                     (or (= temp___is_init_275 true)
                                     (<= 0 100)) (in_range6 temp___expr_279)))

;; get__post_axiom
  (assert
  (forall ((container us_rep1))
  (forall ((position Int))
  (! (=>
     (and (dynamic_invariant2 position true true true true)
     (and (<= 1 position) (<= position (last container))))
     (dynamic_invariant3 (get container position) true false true true)) :pattern (
  (get container position)) ))))

;; has_key__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((key us_rep3))
  (! (=> (= (distinct 0 0) true)
     (=>
     (exists ((k us_rep3))
     (and (= (has_key container k) true) (= (bool_eq3 k key) true)))
     (= (has_key container key) true))) :pattern ((has_key container key)) ))))

(declare-fun witness (us_rep2 us_rep3) Int)

(declare-fun witness__function_guard (Int us_rep2 us_rep3) Bool)

(declare-fun w_get (us_rep2 Int) Int)

(declare-fun w_get__function_guard (Int us_rep2 Int) Bool)

(declare-sort element_type2 0)

(declare-fun element_typeqtint2 (element_type2) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type2))
  (and (<= 1 (element_typeqtint2 i)) (<= (element_typeqtint2 i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (element_type2 element_type2) Bool)

(declare-const dummy9 element_type2)

(declare-datatypes ()
((element_type__ref2
 (element_type__refqtmk2 (element_type__content2 element_type2)))))
(define-fun element_type__ref_element_type__content__4__projection ((a element_type__ref2)) element_type2 
  (element_type__content2 a))

(define-fun dynamic_invariant4 ((temp___expr_308 Int)
  (temp___is_init_304 Bool) (temp___skip_constant_305 Bool)
  (temp___do_toplevel_306 Bool)
  (temp___do_typ_inv_307 Bool)) Bool (=>
                                     (or (= temp___is_init_304 true)
                                     (<= 1 2147483647)) (in_range7
                                     temp___expr_308)))

;; get__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((key us_rep3))
  (! (=> (= (has_key container key) true)
     (let ((result (get1 container key)))
     (and
     (=> (= (distinct 0 0) true)
     (and (= result (w_get container (witness container key)))
     (forall ((k us_rep3))
     (=> (= (has_key container k) true)
     (= (= (bool_eq3 k key) true)
     (= (witness container key) (witness container k)))))))
     (dynamic_invariant4 result true false true true)))) :pattern ((get1
                                                                   container
                                                                   key)) ))))

;; length__post_axiom
  (assert
  (forall ((container us_rep2)) (! (dynamic_invariant (length3 container)
  true false true true) :pattern ((length3 container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (oeq2 left right) true)
     (and
     (forall ((key us_rep3))
     (=> (= (has_key left key) true)
     (and (= (has_key right key) true) (= (get1 right key) (get1 left key)))))
     (forall ((key us_rep3))
     (=> (= (has_key right key) true) (= (has_key left key) true))))) :pattern (
  (oeq2 left right)) )))

;; is_empty__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (= (= (is_empty container) true)
     (forall ((key us_rep3)) (not (= (has_key container key) true)))) :pattern (
  (is_empty container)) )))

(declare-fun has_witness (us_rep2 Int) Bool)

(declare-fun has_witness__function_guard (Bool us_rep2 Int) Bool)

;; has_witness__post_axiom
  (assert true)

;; witness__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((key us_rep3))
  (! (=> (= (has_key container key) true)
     (let ((result (witness container key)))
     (and (= (has_witness container result) true) (dynamic_invariant result
     true false true true)))) :pattern ((witness container key)) ))))

;; w_get__post_axiom
  (assert
  (forall ((container us_rep2))
  (forall ((witness1 Int))
  (! (=>
     (and (dynamic_invariant witness1 true true true true)
     (= (has_witness container witness1) true)) (dynamic_invariant4
     (w_get container witness1) true false true true)) :pattern ((w_get
                                                                 container
                                                                 witness1)) ))))

(declare-const container__split_fields us_main_type)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 new_item true false true true))

;; Assume
  (assert (dynamic_invariant count true false true true))

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__my_lists__my_lists__list__capacity container__split_discrs)) 
  o))

(define-fun o1 () Int (- o count))

(assert
;; defqtvc
 ;; File "a-cfdlli.ads", line 694, characters 0-0
  (not (in_range4 o1)))
(check-sat)
